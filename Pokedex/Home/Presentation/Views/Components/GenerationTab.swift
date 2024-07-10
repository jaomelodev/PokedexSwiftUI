//
//  GenerationTab.swift
//  Pokedex
//
//  Created by João Melo on 30/05/24.
//

import SwiftUI

struct GenerationTab: View {
    @Binding var selectedGeneration: PokemonGeneration
    @Binding var showBottomSheet: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Generations")
                    .font(TextStyles.pokemonName)
                Text("Use search for generations to explore your Pokémon!")
                    .font(TextStyles.description)
                    .foregroundColor(.textGray)
                    .padding([.bottom], 35)
                
                LazyVGrid(
                    columns: [
                        GridItem(
                            .flexible(minimum: 150),
                            spacing: 14
                        ),
                        GridItem(
                            .flexible(minimum: 150),
                            spacing: 14
                        )
                    ],
                    spacing: 14
                ) {
                    ForEach(PokemonGeneration.allCases) { generation in
                        GenerationButton(
                            generation: generation,
                            isSelected: generation == selectedGeneration,
                            changeGeneration: {
                                selectedGeneration = generation
                                showBottomSheet = false
                            }
                        )
                    }
                }
            }
        }
        .padding([.top, .bottom], 30)
        .padding([.trailing, .leading], 40)
    }
}

#Preview {
    struct ContainderView: View {
        @State var selectedGeneration: PokemonGeneration = .I
        @State var showBottomSheet: Bool = true
        
        var body: some View {
            GenerationTab(
                selectedGeneration: $selectedGeneration,
                showBottomSheet: $showBottomSheet
            )
            .padding()
        }
    }
    
    return ContainderView()
}
