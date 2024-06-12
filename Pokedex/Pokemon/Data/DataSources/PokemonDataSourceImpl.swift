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
                    for pokemon in graphQLResult.data?.pokemon_v2_generation_by_pk?.pokemon_v2_pokemonspecies ?? [] {
                        guard let stats = pokemon.pokemon_v2_pokemons.first else {
                            continue
                        }
                        
                        let pokemonId = pokemon.id
                        let pokemonName = pokemon.name
                        let pokemonHeight = stats.height
                        let pokemonWeight = stats.weight
                        
                        var pokemonTypes: [PokemonType] = []
                        for type in stats.pokemon_v2_pokemontypes {
                            if let pokemonType = PokemonType(rawValue: type.pokemon_v2_type?.name ?? "") {
                                pokemonTypes.append(pokemonType)
                            }
                        }
                        
                        let pokemonEntity = PokemonEntity(
                            id: pokemonId,
                            name: pokemonName,
                            height: pokemonHeight!,
                            weight: pokemonWeight!,
                            types: pokemonTypes
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


