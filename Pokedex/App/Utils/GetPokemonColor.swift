//
//  GetPokemonColor.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import SwiftUI

func getPokemonColor(_ type: PokemonType) -> Color {
    switch type {
    case .bug:
        return .typeBug
    case .dark:
        return .typeDark
    case .dragon:
        return .typeDragon
    case .electric:
        return .typeElectric
    case .fairy:
        return .typeFairy
    case .fighting:
        return .typeFighting
    case .fire:
        return .typeFire
    case .flying:
        return .typeFlying
    case .ghost:
        return .typeGhost
    case .grass:
        return .typeGrass
    case .ground:
        return .typeGround
    case .ice:
        return .typeIce
    case .normal:
        return .typeNormal
    case .poison:
        return .typePoison
    case .psychic:
        return .typePsychic
    case .rock:
        return .typeRock
    case .steel:
        return .typeSteel
    case .water:
        return .typeWater
    }
}
