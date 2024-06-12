//
//  HomeController.swift
//  Pokedex
//
//  Created by João Melo on 28/05/24.
//

enum PokemonTab {
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
    @Published var pokemonsListFiltered: [PokemonEntity] = []
    
    var currentTab: PokemonTab = .generations
    
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
            
            self.pokemonsList = pokemons
            
            filterParemeters = FilterParemetersEntity(
                sliderBounds: (pokemons.first?.id ?? 0)...(pokemons.last?.id ?? 1),
                sliderCurrentRange: (pokemons.first?.id ?? 0)...(pokemons.last?.id ?? 1)
            )
            
            filterPokemonsByName()
            
            pokemonLoading = .success
        } catch {
            pokemonLoading = .failure
        }
    }
    
    func filterPokemonsByName() -> Void {
        if pokemonTextInput.count < 3 {
            self.pokemonsListFiltered = self.pokemonsList
            return
        }
        
        let pokemons = self.pokemonsList.filter { $0.name.contains(pokemonTextInput.lowercased()) }
        
        self.pokemonsListFiltered = pokemons
    }
    
    func sortPokemons() -> Void {
        switch selectedSortType {
        case .smallFirst:
            self.pokemonsListFiltered.sort(by: { $0.id < $1.id })
        case .highFirst:
            self.pokemonsListFiltered.sort(by: { $0.id > $1.id })
        case .aToZ:
            self.pokemonsListFiltered.sort(by: { $0.name < $1.name })
        case .zToA:
            self.pokemonsListFiltered.sort(by: { $0.name > $1.name })
        }
    }
}
