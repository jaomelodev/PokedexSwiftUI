//
//  PokedexIconButton.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import SwiftUI

struct PokedexIconButton: View {
    let icon: String
    let color: Color
    let active: Bool
    let action: () -> Void
    
    init(pokemonType: PokemonType, active: Bool, action: @escaping () -> Void) {
        self.icon = "Icon\(pokemonType.rawValue.capitalizingFirstLetter())"
        self.color = getPokemonColor(pokemonType)
        self.active = active
        self.action = action
    }
    
    init(heightType: PokemonHeight, active: Bool, action: @escaping () -> Void) {
        self.icon = "IconHeight\(heightType.rawValue)"
        self.color = getPokemonHeightColor(heightType)
        self.active = active
        self.action = action
    }
    
    init(weightType: PokemonWeight, active: Bool, action: @escaping () -> Void) {
        self.icon = "IconWeight\(weightType.rawValue)"
        self.color = getPokemonWeightColor(weightType)
        self.active = active
        self.action = action
    }
    
    init(icon: String, color: Color, active: Bool, action: @escaping () -> Void) {
        self.icon = icon
        self.color = color
        self.active = active
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(active ? .textWhite : color)
                .padding(12.5)
                .background(active ? color : .textWhite)
                .cornerRadius(35)
                .shadow(
                    color: color.opacity(active ? 0.3 : 0),
                    radius: 10,
                    y: 7
                )
        }
    }
}

#Preview {
    VStack {
        PokedexIconButton(
            icon: "IconSearch",
            color: .purple,
            active: true,
            action: {}
        )
        PokedexIconButton(
            pokemonType: .dragon,
            active: true,
            action: {}
        )
        PokedexIconButton(
            heightType: .medium,
            active: true,
            action: {}
        )
        PokedexIconButton(
            weightType: .light,
            active: true,
            action: {}
        )
    }
}
