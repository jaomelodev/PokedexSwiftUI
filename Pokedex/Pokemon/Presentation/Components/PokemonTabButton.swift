//
//  PokemonTabButton.swift
//  Pokedex
//
//  Created by João Melo on 30/06/24.
//

import SwiftUI

struct PokemonTabButton: View {
    let label: String
    let action: () -> Void
    let isSelected: Bool
    
    var body: some View {
        Button(action: action) {
            ZStack {
                LinearGradient(
                    colors: [
                        .textWhite.opacity(isSelected ? 0.3 : 0),
                        .textWhite.opacity(0)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .mask {
                    Image("ImagePokeball")
                        .resizable()
                        .frame(
                            width: 100,
                            height: 100
                        )
                }
                
                Text(label)
                    .font(isSelected ? TextStyles.filterTitle : TextStyles.description)
                    .foregroundColor(.textWhite)
                    .offset(y: -25)
            }
            .frame(
                width: 100,
                height: 100
            )
        }
    }
}

#Preview {
    PokemonTabButton(
        label: "About",
        action: {
            print("About")
        },
        isSelected: true
    )
        .background(.backgroundBug)
}
