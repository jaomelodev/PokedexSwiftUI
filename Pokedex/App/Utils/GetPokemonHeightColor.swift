//
//  GetPokemonHeightColor.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import SwiftUI

func getPokemonHeightColor(_ heightType: PokemonHeight) -> Color {
    switch heightType {
    case .short:
        return .heightShort
    case .medium:
        return .heightMedium
    case .tall:
        return .heightTall
    }
}
