//
//  FilterTab.swift
//  Pokedex
//
//  Created by João Melo on 31/05/24.
//

import SwiftUI

struct FilterTab: View {
    @State private var selectedTypes: [PokemonType]
    @State private var selectedWeaknesses: [PokemonType]
    @State private var selectedHeights: [PokemonHeight]
    @State private var selectedWeights: [PokemonWeight]
    
    let sliderBounds: ClosedRange<Int>
    @State var sliderCurrentRange: ClosedRange<Int>
    
    let resetAction: () -> Void
    let applyAction: (FilterParemetersEntity) -> Void
    
    init(
        filterParemeters: FilterParemetersEntity,
        resetAction: @escaping () -> Void,
        applyAction: @escaping (FilterParemetersEntity) -> Void
    ) {
        self.selectedTypes = filterParemeters.selectedTypes
        self.selectedWeaknesses = filterParemeters.selectedWeaknesses
        self.selectedHeights = filterParemeters.selectedHeights
        self.selectedWeights = filterParemeters.selectedWeights
        self.sliderBounds = filterParemeters.sliderBounds
        self.sliderCurrentRange = filterParemeters.sliderCurrentRange
        
        self.resetAction = resetAction
        self.applyAction = applyAction
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Filters")
                    .font(TextStyles.pokemonName)
                    .padding([.trailing, .leading], 40)
                Text("Use advanced search to explore Pokémon by type, weakness, height and more!")
                    .font(TextStyles.description)
                    .foregroundColor(.textGray)
                    .padding([.bottom], 35)
                    .padding([.trailing, .leading], 40)
                
                Text("Types")
                    .font(TextStyles.filterTitle)
                    .padding([.trailing, .leading], 40)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(PokemonType.allCases) { pokemonType in
                            let containsType = selectedTypes.contains(pokemonType)
                            let isFirstElement = pokemonType == PokemonType.allCases.first
                            let isLastElement = pokemonType == PokemonType.allCases.last
                            
                            PokedexIconButton(
                                pokemonType: pokemonType,
                                active: containsType,
                                action: {
                                    if containsType {
                                        selectedTypes.remove(at: selectedTypes.firstIndex(of: pokemonType)!)
                                    } else {
                                        selectedTypes.append(pokemonType)
                                    }
                                }
                            )
                            .padding(.leading, isFirstElement ? 40 : 0)
                            .padding(.trailing, isLastElement ? 10 : 0)
                        }
                    }
                    .padding([.top], 10)
                    .padding([.bottom], 35)
                }
                
                Text("Weaknesses")
                    .font(TextStyles.filterTitle)
                    .padding([.trailing, .leading], 40)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(PokemonType.allCases) { pokemonType in
                            let containsType = selectedWeaknesses.contains(pokemonType)
                            let isFirstElement = pokemonType == PokemonType.allCases.first
                            let isLastElement = pokemonType == PokemonType.allCases.last
                            
                            PokedexIconButton(
                                pokemonType: pokemonType,
                                active: containsType,
                                action: {
                                    if containsType {
                                        selectedWeaknesses.remove(at: selectedWeaknesses.firstIndex(of: pokemonType)!)
                                    } else {
                                        selectedWeaknesses.append(pokemonType)
                                    }
                                }
                            )
                            .padding(.leading, isFirstElement ? 40 : 0)
                            .padding(.trailing, isLastElement ? 10 : 0)
                        }
                    }
                    .padding([.top], 10)
                    .padding([.bottom], 35)
                }
                
                Text("Heights")
                    .font(TextStyles.filterTitle)
                    .padding([.trailing, .leading], 40)
                
                HStack {
                    ForEach(PokemonHeight.allCases) { pokemonHeight in
                        let containsHeight = selectedHeights.contains(pokemonHeight)
                        
                        PokedexIconButton(
                            heightType: pokemonHeight,
                            active: containsHeight,
                            action: {
                                if containsHeight {
                                    selectedHeights.remove(at: selectedHeights.firstIndex(of: pokemonHeight)!)
                                } else {
                                    selectedHeights.append(pokemonHeight)
                                }
                            }
                        )
                    }
                }
                .padding([.top], 10)
                .padding([.bottom], 35)
                .padding([.leading], 40)
                
                Text("Weights")
                    .font(TextStyles.filterTitle)
                    .padding([.trailing, .leading], 40)
                
                HStack {
                    ForEach(PokemonWeight.allCases) { pokemonWeight in
                        let containsWeight = selectedWeights.contains(pokemonWeight)
                        
                        PokedexIconButton(
                            weightType: pokemonWeight,
                            active: containsWeight,
                            action: {
                                if containsWeight {
                                    selectedWeights.remove(at: selectedWeights.firstIndex(of: pokemonWeight)!)
                                } else {
                                    selectedWeights.append(pokemonWeight)
                                }
                            }
                        )
                    }
                }
                .padding([.top], 10)
                .padding([.bottom], 35)
                .padding([.leading], 40)
                
                Text("Number Range")
                    .font(TextStyles.filterTitle)
                    .padding([.trailing, .leading], 40)
                
                PokedexRangeSlider(
                    currentValue: $sliderCurrentRange,
                    sliderBounds: sliderBounds
                )
                .padding([.top], 20)
                .padding([.bottom], 50)
                .padding([.leading, .trailing], 50)
                
                HStack(spacing: 0) {
                    PokedexButton(
                        buttonLable: "Reset",
                        disabled: false,
                        primaryButton: false,
                        action: {
                            selectedTypes.removeAll()
                            selectedWeaknesses.removeAll()
                            selectedHeights.removeAll()
                            selectedWeights.removeAll()
                            sliderCurrentRange = sliderBounds
                            
                            resetAction()
                        }
                    )
                    Spacer().frame(width: 14)
                    PokedexButton(
                        buttonLable: "Apply",
                        disabled: false,
                        action: {
                            let newParemeters = FilterParemetersEntity(
                                selectedTypes: self.selectedTypes,
                                selectedWeaknesses: self.selectedWeaknesses,
                                selectedHeights: self.selectedHeights,
                                selectedWeights: self.selectedWeights,
                                sliderBounds: self.sliderBounds,
                                sliderCurrentRange: self.sliderCurrentRange
                            )
                            
                            applyAction(newParemeters)
                        }
                    )
                }
                .padding([.bottom], 50)
                .padding([.leading, .trailing], 40)
            }
        }
        .padding([.top, .bottom], 30)
//        .padding([.trailing, .leading], 40)
    }
}

#Preview {
    return FilterTab(
        filterParemeters: FilterParemetersEntity(
            sliderBounds: 1...151,
            sliderCurrentRange: 1...151
        ),
        resetAction: {},
        applyAction: { filterParemeters in
            print(filterParemeters)
        }
    )
}
