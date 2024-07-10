//
//  SortTab.swift
//  Pokedex
//
//  Created by João Melo on 31/05/24.
//

import SwiftUI

struct SortTab: View {
    @Binding var selectedSortType: SortType
    @Binding var showBottomSheet: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Sort")
                    .font(TextStyles.pokemonName)
                Text("Sort Pokémons alphabetically or by National Pokédex number!")
                    .font(TextStyles.description)
                    .foregroundColor(.textGray)
                    .padding([.bottom], 15)
                
                ForEach(SortType.allCases) { sortType in
                    PokedexButton(
                        buttonLable: sortType.rawValue,
                        disabled: false,
                        primaryButton: selectedSortType == sortType,
                        action: {
                            selectedSortType = sortType
                            showBottomSheet = false
                        }
                    )
                }
                .padding([.top],20)
            }
        }
        .padding([.top, .bottom], 30)
        .padding([.trailing, .leading], 40)
    }
}

#Preview {
    struct ContainderView: View {
        @State var selectedSortType: SortType = .smallFirst
        @State var showBottomSheet: Bool = true
        
        var body: some View {
            SortTab(
                selectedSortType: $selectedSortType,
                showBottomSheet: $showBottomSheet
            )
        }
    }
    
    return ContainderView()
}
