//
//  PokemonDataSourceImpl.swift
//  Pokedex
//
//  Created by João Melo on 27/05/24.
//

import Foundation

class PokemonDataSourceImpl: PokemonDataSource {
    let client: ApolloClient
    
    init(apolloClient: ApolloClient) {
        self.client = apolloClient
    }
    
    func fetchPokemonByGeneration(generationId: Int) async throws -> [PokemonEntity] {
        try await withCheckedThrowingContinuation { continuation in
            self.client.fetch(query: PokeAPI.GetPokemonsByGenerationQuery(generationId: generationId)) { result in
                switch result {
                case .success(let graphQLResult):
                    var pokemonList: [PokemonEntity] = []
                    for pokemonSpecy in graphQLResult.data?.pokemon_v2_generation_by_pk?.pokemon_v2_pokemonspecies ?? [] {
                        guard let pokemon = pokemonSpecy.pokemon_v2_pokemons.first else {
                            continue
                        }
                        
                        guard let pokemonDescription = pokemonSpecy.pokemon_v2_pokemonspeciesflavortexts.first?.flavor_text else {
                            continue
                        }
                        
                        guard let evolutions = pokemonSpecy.pokemon_v2_evolutionchain?.pokemon_v2_pokemonspecies else {
                            continue
                        }
                        
                        let pokemonId = pokemonSpecy.id
                        let pokemonName = pokemonSpecy.name
                        let pokemonHeight = pokemon.height
                        let pokemonWeight = pokemon.weight
                        let pokemonCacthRate = pokemonSpecy.capture_rate
                        let pokemonBaseHappines = pokemonSpecy.base_happiness
                        let pokemonGrowthRate = pokemonSpecy.pokemon_v2_growthrate?.name
                        let pokemonBaseExp = pokemon.base_experience
                        let pokemonGenderRate = pokemonSpecy.gender_rate
                        let pokemonEggCycles = pokemonSpecy.hatch_counter
                        
                        var pokemonTypes: [PokemonType] = []
                        for type in pokemon.pokemon_v2_pokemontypes {
                            if let pokemonType = PokemonType(rawValue: type.pokemon_v2_type?.name ?? "") {
                                pokemonTypes.append(pokemonType)
                            }
                        }
                        
                        var pokemonStats: [PokemonStatEntity] = []
                        for pokemonStat in pokemon.pokemon_v2_pokemonstats {
                            let stat = PokemonStatEntity(
                                baseStat: pokemonStat.base_stat,
                                effortValue: pokemonStat.effort,
                                statName: pokemonStat.pokemon_v2_stat?.name ?? ""
                            )
                            
                            pokemonStats.append(stat)
                        }
                        
                        var pokemonAbilities: [PokemonAbilityEntity] = []
                        for pokemonAbility in pokemon.pokemon_v2_pokemonabilities {
                            guard let abilityName = pokemonAbility.pokemon_v2_ability?.name else {
                                continue
                            }
                            let ability = PokemonAbilityEntity(name: abilityName, isHidden: pokemonAbility.is_hidden)
                            
                            pokemonAbilities.append(ability)
                        }
                        
                        let pokemonEggGroups = pokemonSpecy.pokemon_v2_pokemonegggroups.map { $0.pokemon_v2_egggroup?.name ?? "" }
                        
                        var pokemonEvolutionChain: [PokemonEvolutionEntity] = []
                        for evolutionData in evolutions {
                            guard let evolves_from_species_id = evolutionData.evolves_from_species_id else {
                                continue
                            }
                            
                            let evolution = PokemonEvolutionEntity(
                                id: evolutionData.id,
                                name: evolutionData.name,
                                minLevel: evolutionData.pokemon_v2_pokemonevolutions.first?.min_level ?? 0,
                                evolvesFromSpeciesId: evolves_from_species_id,
                                evolvesFromSpeciesName: evolutionData.pokemon_v2_pokemonspecy?.name ?? ""
                            )
                            
                            pokemonEvolutionChain.append(evolution)
                        }
                        
                        let pokemonEntity = PokemonEntity(
                            id: pokemonId,
                            name: pokemonName,
                            description: pokemonDescription,
                            height: pokemonHeight ?? 0,
                            weight: pokemonWeight ?? 0,
                            catchRate: pokemonCacthRate ?? 0,
                            baseHappiness: pokemonBaseHappines ?? 0,
                            growthRate: pokemonGrowthRate ?? "",
                            baseExp: pokemonBaseExp ?? 0,
                            genderRate: pokemonGenderRate ?? 0,
                            eggCycles: pokemonEggCycles ?? 0,
                            eggGroups: pokemonEggGroups,
                            types: pokemonTypes,
                            evolutionChain: pokemonEvolutionChain,
                            pokemonStats: pokemonStats,
                            pokemonAbilities: pokemonAbilities
                        )
                        
                        pokemonList.append(pokemonEntity)
                    }
                    continuation.resume(returning: pokemonList)
                case .failure(let error):
                    print("Failure! Error: \(error)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}


