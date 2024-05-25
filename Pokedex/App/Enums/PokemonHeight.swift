//
//  PokemonHeight.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

enum PokemonHeight: String, CaseIterable, Identifiable {
    case short = "Short"
    case medium = "Medium"
    case tall = "Tall"
    
    var id: PokemonHeight { self }
}
