//
//  PokemonDataSource.swift
//  Pokedex
//
//  Created by João Melo on 27/05/24.
//

import Foundation

protocol PokemonDataSource {
    func fetchPokemonByGeneration(generationId: Int) async throws -> [PokemonEntity]
}
