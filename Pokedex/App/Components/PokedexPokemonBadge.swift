//
//  PokedexPokemonBadge.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import SwiftUI

struct PokedexPokemonBadge: View {
    let pokemonType: PokemonType
    
    var color: Color { getPokemonColor(pokemonType) }
    var typeName: String {
        pokemonType.rawValue.capitalizingFirstLetter()
    }
    
    var body: some View {
        HStack {
            Image("Icon\(typeName)")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
            
            Text(typeName)
                .font(TextStyles.pokemonType)
        }
        .foregroundColor(.white)
        .padding(5)
        .background(color)
        .cornerRadius(3)
    }
}

#Preview {
    PokedexPokemonBadge(
        pokemonType: .dark
    )
}
