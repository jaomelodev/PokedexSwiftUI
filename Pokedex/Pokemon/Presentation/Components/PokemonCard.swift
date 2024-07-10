//
//  PokemonCard.swift
//  Pokedex
//
//  Created by João Melo on 15/06/24.
//

import SwiftUI

struct PokemonCard: View {
    let pokemon: PokemonEntity
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            Gradient.Stop(
                                color: .textWhite.opacity(0.35),
                                location: 0
                            ),
                            Gradient.Stop(
                                color:  .textWhite.opacity(0),
                                location: 0.35
                            ),
                        ]
                    ),
                    
                    startPoint: .bottom,
                    endPoint: .topLeading
                )
                .mask {
                    Image("ImageCircle")
                        .resizable()
                        .frame(
                            width: 125,
                            height: 125
                        )
                }
                .frame(width: 125)
                AsyncImage(url: URL(string: pokemon.pokemonImageUrl)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 125, maxHeight: 125)
                    case .failure:
                        Image(systemName: "exclamationmark.warninglight")
                    @unknown default:
                        EmptyView()
                    }
                }
            }
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
            .padding([.leading], 25)
        }
        .frame(height: 125)
    }
}

#Preview {
    PokemonCard(
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
    .background(.backgroundGrass)
}
