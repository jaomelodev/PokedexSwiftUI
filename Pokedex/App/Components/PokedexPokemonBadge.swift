//
//  PokedexPokemonBadge.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import SwiftUI

struct PokedexPokemonBadge: View {
    let pokemonType: PokemonType
    let showLabel: Bool
    
    init(pokemonType: PokemonType) {
        self.pokemonType = pokemonType
        self.showLabel = true
    }
    
    init(pokemonType: PokemonType, showLabel: Bool) {
        self.pokemonType = pokemonType
        self.showLabel = showLabel
    }
    
    var color: Color { getPokemonColor(pokemonType) }
    var typeName: String {
        pokemonType.rawValue.capitalized
    }
    
    var body: some View {
        HStack {
            Image("Icon\(typeName)")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
            
            if showLabel {
                Text(typeName)
                    .font(TextStyles.pokemonType)
            }
        }
        .foregroundColor(.white)
        .padding(5)
        .background(color)
        .cornerRadius(3)
    }
}

#Preview {
    VStack {
        PokedexPokemonBadge(
            pokemonType: .dark
        )
        PokedexPokemonBadge(
            pokemonType: .bug,
            showLabel: false
        )
    }
}
