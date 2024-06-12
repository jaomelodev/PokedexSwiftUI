//
//  GetPokemonBackgroundColor.swift
//  Pokedex
//
//  Created by João Melo on 28/05/24.
//

import SwiftUI

func getPokemonBackgroundColor(_ type: PokemonType) -> Color {
    switch type {
    case .bug:
        return .backgroundBug
    case .dark:
        return .backgroundDark
    case .dragon:
        return .backgroundDragon
    case .electric:
        return .backgroundElectric
    case .fairy:
        return .backgroundFairy
    case .fighting:
        return .backgroundFighting
    case .fire:
        return .backgroundFire
    case .flying:
        return .backgroundFlying
    case .ghost:
        return .backgroundGhost
    case .grass:
        return .backgroundGrass
    case .ground:
        return .backgroundGround
    case .ice:
        return .backgroundIce
    case .normal:
        return .backgroundNormal
    case .poison:
        return .backgroundPoison
    case .psychic:
        return .backgroundPsychic
    case .rock:
        return .backgroundRock
    case .steel:
        return .backgroundSteel
    case .water:
        return .backgroundWater
    }
}

