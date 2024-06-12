//
//  GetPokemonsByGenerationUseCase.swift
//  Pokedex
//
//  Created by João Melo on 28/05/24.
//

import Foundation

class GetPokemonsByGenerationUseCase: UseCase {
    typealias ResultUseCase = [PokemonEntity]
    typealias ParamsUseCase = Int
    
    let pokemonDataSource: PokemonDataSource
    
    init(pokemonDataSource: PokemonDataSource) {
        self.pokemonDataSource = pokemonDataSource
    }
    
    func execute(_ params: Int) async throws -> [PokemonEntity] {
        return try await pokemonDataSource.fetchPokemonByGeneration(generationId: params)
    }
}
