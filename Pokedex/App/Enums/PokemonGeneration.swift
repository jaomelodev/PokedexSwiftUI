//
//  PokemonGeneration.swift
//  Pokedex
//
//  Created by João Melo on 30/05/24.
//

enum PokemonGeneration: Int, CaseIterable, Identifiable {
    case I = 1
    case II = 2
    case III = 3
    case IV = 4
    case V = 5
    case VI = 6
    case VII = 7
    case VIII = 8
    
    var id: PokemonGeneration { self }
}
