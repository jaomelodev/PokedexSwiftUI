//
//  PokemonStatsTab.swift
//  Pokedex
//
//  Created by João Melo on 30/06/24.
//

import SwiftUI

struct PokemonStatsTab: View {
    let pokemon: PokemonEntity
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Base Stats")
                .font(TextStyles.filterTitle)
                .foregroundColor(getPokemonColor(pokemon.types.first!))
                .padding([.bottom], 20)
            
            ForEach(pokemon.pokemonStats, id: \.statName) { pokemonStat in
                PokemonBaseStatInfo(
                    pokemonStat: pokemonStat,
                    color: getPokemonColor(pokemon.types.first!)
                )
                .padding([.bottom], 15)
            }
            
            
            HStack (spacing: 0) {
                HStack {
                    Text("Total")
                        .font(TextStyles.pokemonType)
                        .foregroundColor(.textBlack)
                    
                    Spacer()
                    
                    Text(String(pokemon.pokemonStats.reduce(0, { $0 + $1.baseStat })))
                        .font(TextStyles.filterTitle)
                        .foregroundColor(.textGray)
                }
                .frame(width: 85)
                
                Spacer()
                
                Text("Min")
                    .font(TextStyles.pokemonType)
                    .foregroundColor(.textBlack)
                    .frame(width: 30, alignment: .trailing)
                    .padding([.trailing], 10)
                
                Text("Max")
                    .font(TextStyles.pokemonType)
                    .foregroundColor(.textBlack)
                    .frame(width: 30, alignment: .trailing)
            }
            .padding([.bottom], 20)
            
            Text("The ranges shown on the right are for a level 100 Pokémon. Maximum values are based on a beneficial nature, 252 EVs, 31 IVs; minimum values are based on a hindering nature, 0 EVs, 0 IVs.")
                .font(TextStyles.pokemonType)
                .foregroundColor(.textGray)
                .padding([.bottom], 15)
            
            Text("Type Defenses")
                .font(TextStyles.filterTitle)
                .foregroundColor(getPokemonColor(pokemon.types.first!))
                .padding([.bottom], 20)
            
            Text("The effectiveness of each type on \(pokemon.nameCapitalized).")
                .font(TextStyles.description)
                .foregroundColor(.textGray)
                .padding([.bottom], 20)
            
            HStack {
                ForEach(PokemonType.allCases.prefix(PokemonType.allCases.count / 2)) { pokemonType in
                    let pokemonDamageRelation: Double = pokemon.pokemonDamageRelation[pokemonType] ?? 1
                    
                    VStack {
                        PokedexPokemonBadge(pokemonType: pokemonType, showLabel: false)
                        Text(String(damageRelationLabels[pokemonDamageRelation]!))
                            .font(TextStyles.description)
                            .foregroundColor(.textGray)
                    }
                    
                    if pokemonType != PokemonType.allCases.prefix(PokemonType.allCases.count / 2).last {
                        Spacer()
                    }
                }
            }
            .padding([.bottom], 20)
            
            HStack {
                ForEach(PokemonType.allCases.suffix(PokemonType.allCases.count / 2)) { pokemonType in
                    let pokemonDamageRelation: Double = pokemon.pokemonDamageRelation[pokemonType] ?? 1
                    
                    VStack {
                        PokedexPokemonBadge(pokemonType: pokemonType, showLabel: false)
                        Text(String(damageRelationLabels[pokemonDamageRelation]!))
                            .font(TextStyles.description)
                            .foregroundColor(.textGray)
                    }
                    
                    if pokemonType != PokemonType.allCases.suffix(PokemonType.allCases.count / 2).last {
                        Spacer()
                    }
                }
            }
                
        }
        .padding(40)
        
        
    }
}

#Preview {
    PokemonStatsTab(
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
            evolutionChain: [],
            pokemonStats: [
                PokemonStatEntity(
                    baseStat: 45,
                    effortValue: 0,
                    statName: "hp"
                ),
                PokemonStatEntity(
                    baseStat: 49,
                    effortValue: 0,
                    statName: "attack"
                ),
                PokemonStatEntity(
                    baseStat: 49,
                    effortValue: 0,
                    statName: "defense"
                ),
                PokemonStatEntity(
                    baseStat: 65,
                    effortValue: 0,
                    statName: "special-attack"
                ),
                PokemonStatEntity(
                    baseStat: 65,
                    effortValue: 0,
                    statName: "special-defense"
                ),
                PokemonStatEntity(
                    baseStat: 45,
                    effortValue: 0,
                    statName: "speed"
                )
            ],
            pokemonAbilities: []
        )
    )
}
