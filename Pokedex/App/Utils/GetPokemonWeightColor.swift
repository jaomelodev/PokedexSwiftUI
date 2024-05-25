//
//  GetPokemonWeightColor.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import SwiftUI

func getPokemonWeightColor(_ weightType: PokemonWeight) -> Color {
    switch weightType {
    case .light:
        return .weightLight
    case .normal:
        return .weightNormal
    case .heavy:
        return .weightHeavy
    }
}
