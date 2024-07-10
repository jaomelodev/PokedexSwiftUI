//
//  PokemonAboutTabLabelInfo.swift
//  Pokedex
//
//  Created by João Melo on 30/06/24.
//

import SwiftUI

struct PokemonAboutTabLabelInfo: View {
    let label: String
    let info: String?
    let secondaryInfo: String?
    let genderRate: Int?
    let pokemonTypes: [PokemonType]
    let customView: AnyView?
    
    init(label: String, info: String) {
        self.label = label
        self.info = info
        self.secondaryInfo = nil
        self.genderRate = nil
        self.pokemonTypes = []
        self.customView = nil
    }
    
    init(label: String, info: String, secondaryInfo: String) {
        self.label = label
        self.info = info
        self.secondaryInfo = secondaryInfo
        self.genderRate = nil
        self.pokemonTypes = []
        self.customView = nil
    }
    
    init(genderRate: Int) {
        self.label = "Gender"
        self.info = nil
        self.secondaryInfo = nil
        self.genderRate = genderRate
        self.pokemonTypes = []
        self.customView = nil
    }
    
    init(label: String, pokemonTypes: [PokemonType]) {
        self.label = label
        self.pokemonTypes = pokemonTypes
        self.info = nil
        self.genderRate = nil
        self.customView = nil
        self.secondaryInfo = nil
    }
    
    init(label: String, @ViewBuilder customView: () -> AnyView) {
        self.label = label
        self.customView = customView()
        self.pokemonTypes = []
        self.info = nil
        self.genderRate = nil
        self.secondaryInfo = nil
    }
    
    var body: some View {
        HStack {
            Text(label)
                .font(TextStyles.pokemonType)
                .multilineTextAlignment(.leading)
                .frame(width: 100, alignment: .leading)
        
            if genderRate != nil {
                let femaleChance = (Double(genderRate!) / 8.0) * 100
                let maleChance = 100 - femaleChance
                
                HStack (spacing: 0) {
                    Text("♂ ")
                        .foregroundColor(.typeFlying)
    
                    
                    Text("\(getPercentageLabel(percentage: maleChance))%  ")
                        .font(TextStyles.description)
                        .foregroundColor(.typeFlying)
                    
                    Text("♀ ")
                        .foregroundColor(.typeFairy)
                    Text("\(getPercentageLabel(percentage: femaleChance))%")
                        .font(TextStyles.description)
                        .foregroundColor(.typeFairy)
                }
            } else if info != nil {
                InfoText(info: info!, secondaryInfo: secondaryInfo)
            } else if !pokemonTypes.isEmpty {
                ForEach(pokemonTypes) { pokemonType in
                    PokedexPokemonBadge(
                        pokemonType: pokemonType,
                        showLabel: false
                    )
                }
            } else if customView != nil {
                customView
            }
            
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func InfoText(
        info: String,
        secondaryInfo: String?
    ) -> some View {
        HStack(alignment:.bottom ,spacing:0) {
            Text(info)
                .font(TextStyles.description)
                .foregroundColor(.textGray)
            
            if (secondaryInfo != nil) {
                Text(secondaryInfo!)
                    .font(TextStyles.pokemonType)
                    .foregroundColor(.textGray)
            }
        }
    }
}

#Preview {
    VStack {
        PokemonAboutTabLabelInfo(
            label: "Species",
            info: "Seed Pokemon"
        )
        PokemonAboutTabLabelInfo(
            label: "Height",
            info: "0.7m",
            secondaryInfo: "(2'04\")"
        )
        PokemonAboutTabLabelInfo(label: "Abilities") {
            AnyView(
                VStack(spacing:0) {
                    Text("1. Overgrowth")
                        .font(TextStyles.description)
                        .foregroundColor(.textGray)
                    
                    Text("2. Hidden")
                        .font(TextStyles.pokemonType)
                        .foregroundColor(.textGray)
                    
                }
            )
        }
        PokemonAboutTabLabelInfo(
            label: "Weaknesses",
            pokemonTypes: [
                .fire,
                .flying,
                .ice,
                .psychic
            ]
        )
        PokemonAboutTabLabelInfo(
            genderRate: 7
        )
    }
}
