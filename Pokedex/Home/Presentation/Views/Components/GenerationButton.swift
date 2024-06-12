//
//  GenerationButton.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import SwiftUI

struct GenerationButton: View {
    let generation: PokemonGeneration
    let isSelected: Bool
    let changeGeneration: () -> Void
    
    var body: some View {
        Button(action: changeGeneration) {
            ZStack {
                LinearGradient(
                    colors: [
                        isSelected ? .textWhite.opacity(0.3) : .vectorGray,
                        isSelected ? .textWhite.opacity(0) : .vectorGray.opacity(0)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .mask {
                    Image("Image6x3")
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 35)
                        .position(x:55, y: 27.5)
                }
                GeometryReader { geometry in
                    LinearGradient(
                        colors: [
                            isSelected ? .textWhite.opacity(0.3) : .vectorPokeballGray,
                            isSelected ? .textWhite.opacity(0) : .vectorGray
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .mask {
                        Image("ImagePokeball")
                            .resizable()
                            .frame(maxWidth: 110, maxHeight: 110)
                            .position(x: geometry.size.width - 45, y: geometry.size.height - 3)
                    }
                }
                VStack {
                    Image("\(generation)Generation")
                        .resizable()
                        .frame(maxWidth: 125, maxHeight: 45)
                    
                    Text("Generation \(generation)")
                        .font(TextStyles.description)
                        .foregroundColor(isSelected ? .textWhite : .textGray)
                }
                .padding([.top], 30)
                .padding([.trailing, .leading], 17.5)
                .padding([.bottom], 20)
            }
        }
        .frame(maxHeight: 129)
        .background(isSelected ? .typePsychic : .backgroundDefaultInput)
        .cornerRadius(10)
        .shadow(
            color: .typePsychic.opacity(isSelected ? 0.3 : 0),
            radius: 20,
            y: 10
        )
        .animation(.easeIn, value: isSelected)
    }
}

#Preview {
    GenerationButton(
        generation: .II,
        isSelected: true,
        changeGeneration: {}
    )
}
