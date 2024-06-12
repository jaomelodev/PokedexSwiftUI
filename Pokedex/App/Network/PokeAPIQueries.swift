//
//  PokeAPIQueries.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import Apollo

struct PokeAPIQueries {
    let graphQLQuery = GraphQLQuery()
    
    static let getPokemonsByGeneration = """
        query GetPokemonsByGeneration($generationId) {
          pokemon_v2_generation_by_pk(id: $generationId) {
            pokemon_v2_pokemonspecies(order_by: {id: asc}) {
              name
              id
              pokemon_v2_pokemons {
                height
                weight
                pokemon_v2_pokemontypes {
                  pokemon_v2_type {
                    name
                  }
                }
              }
              pokemon_v2_evolutionchain {
                pokemon_v2_pokemonspecies {
                  id
                  name
                  evolves_from_species_id
                  pokemon_v2_pokemonevolutions {
                    min_level
                    id
                  }
                  pokemon_v2_pokemonspecy {
                    name
                  }
                }
              }
            }
          }
        }
    """
}
