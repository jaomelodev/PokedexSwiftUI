//
//  PokemonAbilityEntity.swift
//  Pokedex
//
//  Created by João Melo on 06/07/24.
//

import Foundation

struct PokemonAbilityEntity {
    let name: String
    let isHidden: Bool
    
    var capitalizedName: String {
        name.capitalized
    }
}
