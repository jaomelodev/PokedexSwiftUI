//
//  PokemonEvolutionTab.swift
//  Pokedex
//
//  Created by João Melo on 30/06/24.
//

import SwiftUI

struct PokemonEvolutionTab: View {
    let pokemon: PokemonEntity
    
    var evolutionChainSorted: [PokemonEvolutionEntity] {
        return pokemon.pokemonEvolutionChain.sorted { $0.minLevel < $1.minLevel }
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Evolution Chart")
                .font(TextStyles.filterTitle)
                .foregroundColor(getPokemonColor(pokemon.types.first!))
                .padding([.bottom], 20)
            
            if evolutionChainSorted.isEmpty {
                HStack {
                    Spacer()
                    
                    VStack(spacing:0) {
                        ZStack {
                            LinearGradient(
                                colors: [
                                    .vectorPokeball,
                                    .textWhite
                                ],
                                startPoint: .center,
                                endPoint: .bottom
                            )
                            .frame(width: 200, height: 200)
                            
                            .mask {
                                Image("ImagePokeball")
                                    .resizable()
                                    .frame(
                                        width: 200,
                                        height: 200
                                    )
                            }
                            
                            AsyncImage(url: URL(string: pokemon.pokemonImageUrl)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image.resizable()
                                         .aspectRatio(contentMode: .fit)
                                         .frame(maxWidth: 175, maxHeight: 175)
                                case .failure:
                                    Image(systemName: "exclamationmark.warninglight")
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                        
                        Text("#" + String(pokemon.id)
                            .padStart(
                                toLength: 3,
                                withPad: "0"
                            )
                        )
                        .font(TextStyles.pokemonType)
                        .foregroundColor(.textGray)
                        
                        Text("\(pokemon.nameCapitalized) doesn't have evolutions")
                            .font(TextStyles.filterTitle)
                            .foregroundColor(.textBlack)
                    }
                    
                    Spacer()
                }
            } else {
                ForEach(evolutionChainSorted) { evolution in
                    HStack(spacing: 0) {
                        VStack(spacing:0) {
                            ZStack {
                                LinearGradient(
                                    colors: [
                                        .vectorPokeball,
                                        .textWhite
                                    ],
                                    startPoint: .center,
                                    endPoint: .bottom
                                )
                                .frame(width: 100, height: 100)
                                
                                .mask {
                                    Image("ImagePokeball")
                                        .resizable()
                                        .frame(
                                            width: 100,
                                            height: 100
                                        )
                                }
                                
                                AsyncImage(url: URL(string: evolution.pokemonEvolvesFromSpeciesImageUrl)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image.resizable()
                                             .aspectRatio(contentMode: .fit)
                                             .frame(maxWidth: 75, maxHeight: 75)
                                    case .failure:
                                        Image(systemName: "exclamationmark.warninglight")
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }
                            
                            Text("#" + String(evolution.evolvesFromSpeciesId)
                                .padStart(
                                    toLength: 3,
                                    withPad: "0"
                                )
                            )
                            .font(TextStyles.pokemonType)
                            .foregroundColor(.textGray)
                            
                            Text(evolution.evolvesFromSpeciesNameCapitalized)
                                .font(TextStyles.filterTitle)
                                .foregroundColor(.textBlack)
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 0) {
                            Image("IconFront")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.vectorPokeball)
                            
                            if evolution.minLevel != 0 {
                                Text("(Level \(evolution.minLevel))")
                                    .font(TextStyles.pokemonNumber)
                            }
                        }
                        .padding([.bottom], 30)
                        
                        Spacer()
                        
                        VStack(spacing:0) {
                            ZStack {
                                LinearGradient(
                                    colors: [
                                        .vectorPokeball,
                                        .textWhite
                                    ],
                                    startPoint: .center,
                                    endPoint: .bottom
                                )
                                .frame(width: 100, height: 100)
                                
                                .mask {
                                    Image("ImagePokeball")
                                        .resizable()
                                        .frame(
                                            width: 100,
                                            height: 100
                                        )
                                }
                                
                                AsyncImage(url: URL(string: evolution.pokemonImageUrl)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image.resizable()
                                             .aspectRatio(contentMode: .fit)
                                             .frame(maxWidth: 75, maxHeight: 75)
                                    case .failure:
                                        Image(systemName: "exclamationmark.warninglight")
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }
                            
                            Text("#" + String(evolution.id)
                                .padStart(
                                    toLength: 3,
                                    withPad: "0"
                                )
                            )
                            .font(TextStyles.pokemonType)
                            .foregroundColor(.textGray)
                            
                            Text(evolution.nameCapitalized)
                                .font(TextStyles.filterTitle)
                                .foregroundColor(.textBlack)
                        }
                    }
                    .padding([.bottom], 30)
                }
            }
        }
        .padding(40)
    }
}

#Preview {
    PokemonEvolutionTab(
        pokemon: PokemonEntity(
            id: 1,
            name: "Bulbasaur",
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
            evolutionChain: [
                PokemonEvolutionEntity(
                    id: 2,
                    name: "Ivysaur",
                    minLevel: 16,
                    evolvesFromSpeciesId: 1,
                    evolvesFromSpeciesName: "Bulbasaur"
                ),
                PokemonEvolutionEntity(
                    id: 3,
                    name: "Venusaur",
                    minLevel: 32,
                    evolvesFromSpeciesId: 2,
                    evolvesFromSpeciesName: "Ivysaur"
                )
            ],
            pokemonStats: [],
            pokemonAbilities: []
        )
    )
}
