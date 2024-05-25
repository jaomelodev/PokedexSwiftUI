//
//  PokemonWeight.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

enum PokemonWeight: String, CaseIterable, Identifiable {
    case light = "Light"
    case normal = "Normal"
    case heavy = "Heavy"
    
    var id: PokemonWeight { self }
}
