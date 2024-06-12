//
//  PokemonEntity.swift
//  Pokedex
//
//  Created by João Melo on 27/05/24.
//

import SwiftUI

struct PokemonEntity: Hashable, Identifiable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [PokemonType]
    
    var nameCapitalized: String {
        name.capitalizingFirstLetter()
    }
    
    var pokemonImageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
}
