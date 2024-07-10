//
//  PokemonAboutTab.swift
//  Pokedex
//
//  Created by João Melo on 30/06/24.
//

import SwiftUI

struct PokemonAboutTab: View {
    let pokemon: PokemonEntity
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(pokemon.description.replacingOccurrences(of: "\n", with: " "))
                .font(TextStyles.description)
                .foregroundColor(.textGray)
                .padding([.bottom], 30)
            
            Text("Pokédex Data")
                .font(TextStyles.filterTitle)
                .foregroundColor(getPokemonColor(pokemon.types.first!))
                .padding([.bottom], 20)
            
            //Place the name if I find this on pokeapi
//            PokemonAboutTabLabelInfo(label: "Species", info: "Seed Pokémon")
//                .padding([.bottom], 15)
            
            PokemonAboutTabLabelInfo(
                label: "Height",
                info: "\(pokemon.heightInMetersLabel) ",
                secondaryInfo: "(\(pokemon.heightInFeetAndInchesLabel))"
            )
                .padding([.bottom], 15)
            
            PokemonAboutTabLabelInfo(
                label: "Weight",
                info: "\(pokemon.weightInKilosLabel) ",
                secondaryInfo: "(\(pokemon.weightInLbsLabel))"
            )
                .padding([.bottom], 15)
            
            PokemonAboutTabLabelInfo(label: "Abilities") {
                AnyView(
                    VStack(alignment: .leading) {
                        ForEach(pokemon.pokemonAbilities.indices, id: \.self) { index in
                            let ability = pokemon.pokemonAbilities[index]
                            
                            HStack(alignment: .bottom, spacing: 0) {
                                Text("\(index + 1). \(ability.capitalizedName)")
                                    .font(TextStyles.description)
                                    .foregroundColor(.textGray)
                                if ability.isHidden {
                                    Text(" (hidden)")
                                        .font(TextStyles.pokemonType)
                                        .foregroundColor(.textGray)
                                }
                            }
                        }
                    }
                )
            }
                .padding([.bottom], 15)
            
            PokemonAboutTabLabelInfo(
                label: "Weaknesses",
                pokemonTypes: PokemonType.allCases.filter { pokemonType in
                    if let pokemonDamageRelation = pokemon.pokemonDamageRelation[pokemonType] {
                        return pokemonDamageRelation >= 2
                    }
                    
                    return false
                }
            )
                .padding([.bottom], 20)
            
            Text("Training")
                .font(TextStyles.filterTitle)
                .foregroundColor(getPokemonColor(pokemon.types.first!))
                .padding([.bottom], 20)
            
            if (!pokemon.pokemonEVStats.isEmpty) {
                PokemonAboutTabLabelInfo(label: "EV Yield") {
                    AnyView(
                        VStack(alignment: .leading) {
                            ForEach(pokemon.pokemonEVStats) {stat in
                                Text("\(stat.effortValue). \(stat.formattedStatName)")
                                    .font(TextStyles.description)
                                    .foregroundColor(.textGray)
                            }
                        }
                    )
                }
                    .padding([.bottom], 15)
            }
            
            PokemonAboutTabLabelInfo(label: "Catch Rate", info: "\(pokemon.catchRate)")
                .padding([.bottom], 15)
            
            PokemonAboutTabLabelInfo(label: "Base Happiness", info: "\(pokemon.baseHappiness)")
                .padding([.bottom], 15)
            
            PokemonAboutTabLabelInfo(label: "Base Exp", info: "\(pokemon.baseExp)")
                .padding([.bottom], 15)
            
            PokemonAboutTabLabelInfo(label: "Growth Rate", info: pokemon.growthRateSanitazed)
                .padding([.bottom], 20)
            
            Text("Breeding")
                .font(TextStyles.filterTitle)
                .foregroundColor(getPokemonColor(pokemon.types.first!))
                .padding([.bottom], 20)
            
            PokemonAboutTabLabelInfo(
                genderRate: pokemon.genderRate
            )
                .padding([.bottom], 15)
            
            PokemonAboutTabLabelInfo(label: "Egg Groups", info: pokemon.eggGroupsLabel)
                .padding([.bottom], 15)
            
            PokemonAboutTabLabelInfo(label: "Egg Cycles", info: "\(pokemon.eggCycles)")
                .padding([.bottom], 20)
            //Removed because is not clearly explained in the designed what are this locations and not found the values in pokeapi
//            Text("Location")
//                .font(TextStyles.filterTitle)
//                .foregroundColor(getPokemonColor(pokemon.types.first!))
//                .padding([.bottom], 20)
//            
//            PokemonAboutTabLabelInfo(label: "001", info: "(Red/Blue/Yellow)")
//                .padding([.bottom], 15)
//            
//            PokemonAboutTabLabelInfo(label: "226", info: "(Gold/Silver/Crystal)")
//                .padding([.bottom], 15)
//            
//            PokemonAboutTabLabelInfo(label: "001", info: "(FireRed/LeafGreen)")
//                .padding([.bottom], 15)
//            
//            PokemonAboutTabLabelInfo(label: "231", info: "(HeartGold/SoulSilver)")
//                .padding([.bottom], 15)
//            
//            PokemonAboutTabLabelInfo(label: "080", info: "(X/Y - Central Kalos)")
//                .padding([.bottom], 15)
//            
//            PokemonAboutTabLabelInfo(label: "001", info: "(Let's Go Pikachu/Let's Go Eevee)")
        }
        .padding(40)
    }
}

#Preview {
    ScrollView {
        PokemonAboutTab(
            pokemon: PokemonEntity(
                id: 1,
                name: "bulbasaur",
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
                pokemonStats: [
                    PokemonStatEntity(baseStat: 45, effortValue: 1, statName: "special-attack")
                ],
                pokemonAbilities: [
                    PokemonAbilityEntity(name: "overgrow", isHidden: false),
                    PokemonAbilityEntity(name: "chlorophyll", isHidden: true)
                ]
            )
        )
    }
}
