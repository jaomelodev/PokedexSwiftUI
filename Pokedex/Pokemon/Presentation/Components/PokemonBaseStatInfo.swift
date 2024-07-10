//
//  PokemonBaseStatInfo.swift
//  Pokedex
//
//  Created by João Melo on 01/07/24.
//

import SwiftUI

struct PokemonBaseStatInfo: View {
    let pokemonStat: PokemonStatEntity
    let color: Color
    
    var body: some View {
        HStack (spacing: 0) {
            HStack {
                Text(pokemonStat.formattedStatName)
                    .font(TextStyles.pokemonType)
                    .foregroundColor(.textBlack)
                
                Spacer()
                
                Text(String(pokemonStat.baseStat))
                    .font(TextStyles.description)
                    .foregroundColor(.textGray)
            }
            .frame(width: 85)
            .padding([.trailing], 10)
            
            ProgressView(
                value: Double(pokemonStat.baseStat),
                total: 255
            )
            .tint(color)
            .padding([.horizontal], 10)
            
            Text(String(pokemonStat.minStat))
                .font(TextStyles.description)
                .foregroundColor(.textGray)
                .frame(width: 30, alignment: .trailing)
                .padding([.trailing], 10)
            
            Text(String(pokemonStat.maxStat))
                .font(TextStyles.description)
                .foregroundColor(.textGray)
                .frame(width: 30, alignment: .trailing)
        }
    }
}

#Preview {
    VStack {
        PokemonBaseStatInfo(
            pokemonStat: PokemonStatEntity(
                baseStat: 45,
                effortValue: 1,
                statName: "hp"
            ),
            color: .typeGrass
        )
        PokemonBaseStatInfo(
            pokemonStat: PokemonStatEntity(
                baseStat: 49,
                effortValue: 1,
                statName: "attack"
            ),
            color: .typeFire
        )
        PokemonBaseStatInfo(
            pokemonStat: PokemonStatEntity(
                baseStat: 49,
                effortValue: 1,
                statName: "special-attack"
            ),
            color: .typeFire
        )
    }
    .padding([.horizontal], 40)
}
