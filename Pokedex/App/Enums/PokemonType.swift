//
//  PokemonType.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

enum PokemonType: String, CaseIterable, Identifiable {
    case bug = "bug"
    case dark = "dark"
    case dragon = "dragon"
    case electric = "electric"
    case fairy = "fairy"
    case fighting = "fighting"
    case fire = "fire"
    case flying = "flying"
    case ghost = "ghost"
    case grass = "grass"
    case ground = "ground"
    case ice = "ice"
    case normal = "normal"
    case poison = "poison"
    case psychic = "psychic"
    case rock = "rock"
    case steel = "steel"
    case water = "water"
    
    var id: PokemonType { self }
}
