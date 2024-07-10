//
//  PokemonListItem.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import SwiftUI

struct PokemonListItem: View {
    let pokemon: PokemonEntity
    
    var backgroundColor: Color {
        getPokemonBackgroundColor(
            pokemon.types.first ?? .normal
        )
    }
    
    var body: some View {
        NavigationLink {
            PokemonPage(pokemon: pokemon)
        } label: {
            ZStack {
                HStack {
                    VStack (alignment: .leading, spacing: 0) {
                        Text("#" + String(pokemon.id)
                            .padStart(
                                toLength: 3,
                                withPad: "0"
                            )
                        )
                        .font(TextStyles.pokemonNumber)
                        .foregroundColor(.textNumber)
                        
                        Text(pokemon.nameCapitalized)
                            .font(TextStyles.pokemonName)
                            .foregroundColor(.textWhite)

                        HStack {
                            ForEach(pokemon.types) { type in
                                PokedexPokemonBadge(pokemonType: type)
                            }
                        }
                        .padding([.top], 5)
                    }
                    .padding([.top, .bottom, .leading], 20)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 115)
                .background(backgroundColor)
                .cornerRadius(10)
                .shadow(
                    color: backgroundColor.opacity(0.4),
                    radius: 20,
                    y: 10
                )
                
                LinearGradient(
                    colors: [
                         .textWhite.opacity(0.3),
                         .textWhite.opacity(0)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .mask {
                    Image("Image6x3")
                        .resizable()
                        .frame(maxWidth: 74, maxHeight: 32)
                        .position(x:127, y: 21)
                }
                GeometryReader { geometry in
                    LinearGradient(
                        colors: [
                            .textWhite.opacity(0.3),
                            .textWhite.opacity(0)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .mask {
                        Image("ImagePokeball")
                            .resizable()
                            .frame(
                                width: 145,
                                height: 145
                            )
                            .position(x: geometry.size.width-60, y: geometry.size.height / 2)
                    }
                }
                GeometryReader { geometry in
                    AsyncImage(url: URL(string: pokemon.pokemonImageUrl)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: 130, maxHeight: 130)
                        case .failure:
                            Image(systemName: "exclamationmark.warninglight")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .position(
                        x: geometry.size.width - 75,
                        y: 35
                    )
                }
            }
            .frame(height: 115)
        }
    .tag(pokemon)
    }
}

#Preview {
    PokemonListItem(
        pokemon: PokemonEntity(
            id: 1,
            name: "Bulbassaur",
            description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.",
            height: 7,
            weight: 69,
            catchRate: 45,
            baseHappiness: 50,
            growthRate: "medium-slow",
            baseExp: 64,
            genderRate: 6,
            eggCycles: 20,
            eggGroups: ["monster", "grass"],
            types: [.grass, .poison],
            evolutionChain: [],
            pokemonStats: [],
            pokemonAbilities: []
        )
    )
    .padding()
}
