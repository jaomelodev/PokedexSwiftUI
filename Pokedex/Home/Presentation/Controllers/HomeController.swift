//
//  HomeController.swift
//  Pokedex
//
//  Created by João Melo on 28/05/24.
//

enum PokemonHomeTab {
    case generations
    case sort
    case filter
}

class HomeController: ObservableObject {
    let getPokemonsByGenerationUseCase = GetPokemonsByGenerationUseCase(
        pokemonDataSource: PokemonDataSourceImpl(apolloClient: apolloClient)
    )
    
    var pokemonsList: [PokemonEntity] = []
    @Published var pokemonLoading: LoadingState = .success
    
    var pokemonListFiltered: [PokemonEntity] = []
    @Published var pokemonsListDisplay: [PokemonEntity] = []
    
    
    var currentTab: PokemonHomeTab = .generations
    
    @Published var selectedGeneration: PokemonGeneration = .I {
        didSet {
            Task {
                await getPokemonsByGeneration(generationId: selectedGeneration.rawValue)
            }
        }
    }
    
    @Published var selectedSortType: SortType = .smallFirst {
        didSet {
            sortPokemons()
        }
    }
    
    @Published var pokemonTextInput: String = "" {
        didSet {
            filterPokemonsByName()
        }
    }
    
    var filterParemeters: FilterParemetersEntity? = FilterParemetersEntity()
    
    func getPokemonsByGeneration(generationId: Int) async -> Void {
        pokemonLoading = .loading
        filterParemeters = nil
        
        do {
            let pokemons = try await getPokemonsByGenerationUseCase.execute(generationId)
            
            pokemonsList = pokemons
            pokemonListFiltered = pokemons
            
            pokemonTextInput = ""
            
            selectedSortType = .smallFirst
            
            filterParemeters = FilterParemetersEntity(
                sliderBounds: (pokemons.first?.id ?? 0)...(pokemons.last?.id ?? 1),
                sliderCurrentRange: (pokemons.first?.id ?? 0)...(pokemons.last?.id ?? 1)
            )
            
            pokemonLoading = .success
        } catch {
            pokemonLoading = .failure
        }
    }
    
    func filterPokemonsByName() -> Void {
        if pokemonTextInput.count < 3 {
            pokemonsListDisplay = self.pokemonListFiltered
            return
        }
        
        let pokemons = self.pokemonListFiltered.filter { $0.name.contains(pokemonTextInput.lowercased()) }
        
        pokemonsListDisplay = pokemons
        
        sortPokemons()
    }
    
    func sortPokemons() -> Void {
        switch selectedSortType {
        case .smallFirst:
            pokemonsListDisplay.sort(by: { $0.id < $1.id })
        case .highFirst:
            pokemonsListDisplay.sort(by: { $0.id > $1.id })
        case .aToZ:
            pokemonsListDisplay.sort(by: { $0.name < $1.name })
        case .zToA:
            pokemonsListDisplay.sort(by: { $0.name > $1.name })
        }
    }
    
    func filterPokemons(newParemeters: FilterParemetersEntity) -> Void {
        filterParemeters = newParemeters
        
        let initialIndex = pokemonsList.firstIndex { $0.id == filterParemeters!.sliderCurrentRange.lowerBound }
        
        let finalIndex = pokemonsList.firstIndex { $0.id == filterParemeters!.sliderCurrentRange.upperBound }
        
        var pokemonsSubList: Array<PokemonEntity>.SubSequence
        
        if (initialIndex ?? 0 < finalIndex ?? 0) {
            pokemonsSubList = pokemonsList[initialIndex!...finalIndex!]
        } else {
            pokemonsSubList = pokemonsList[0...pokemonsList.count - 1]
        }
        
        if (!filterParemeters!.selectedHeights.isEmpty) {
            pokemonsSubList = pokemonsSubList.filter { filterParemeters!.selectedHeights.contains($0.pokemonHeightCategory) }
        }
        
        if (!filterParemeters!.selectedWeights.isEmpty) {
            pokemonsSubList = pokemonsSubList.filter { filterParemeters!.selectedWeights.contains($0.pokemonWeightCategory) }
        }
        
        if !filterParemeters!.selectedTypes.isEmpty {
            pokemonsSubList = pokemonsSubList.filter { pokemon in
                pokemon.types.contains { filterParemeters!.selectedTypes.contains($0) }
            }
        }
        
        if (!filterParemeters!.selectedWeaknesses.isEmpty) {
            pokemonsSubList = pokemonsSubList.filter { pokemon in
                for weakness in newParemeters.selectedWeaknesses {
                    if let damageRelation = pokemon.pokemonDamageRelation[weakness] {
                        if damageRelation >= 2 {
                            return true
                        }
                    }
                }
                
                return false
            }
        }
        
        pokemonListFiltered = Array(pokemonsSubList)
        
        filterPokemonsByName()
    }
    
    func resetFilters() -> Void {
        filterParemeters?.resetFilters()
        
        pokemonListFiltered = pokemonsList
        
        filterPokemonsByName()
    }
}
