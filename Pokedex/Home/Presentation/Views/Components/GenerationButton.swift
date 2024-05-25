//
//  GenerationButton.swift
//  Pokedex
//
//  Created by João Melo on 25/05/24.
//

import SwiftUI

enum PokemonGeneration: String, CaseIterable, Identifiable {
    case I = "I"
    case II = "II"
    case III = "III"
    case IV = "IV"
    case V = "V"
    case VI = "VI"
    case VII = "VII"
    case VIII = "VIII"
    
    var id: PokemonGeneration { self }
}

struct GenerationButton: View {
    let generation: PokemonGeneration
    let isSelected: Bool
    
    var body: some View {
        Button(action: {}) {
            ZStack {
                GeometryReader { geometry in
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
                    Image("\(generation.rawValue)Generation")
                        .resizable()
                        .frame(maxWidth: 125, maxHeight: 45)
                    
                    Text("Generation \(generation.rawValue)")
                        .font(TextStyles.description)
                        .foregroundColor(isSelected ? .textWhite : .textGray)
                }
                .padding([.top], 30)
                .padding([.trailing, .leading], 17.5)
                .padding([.bottom], 20)
            }
        }
        .frame(maxWidth: 160, maxHeight: 129)
        .background(isSelected ? .typePsychic : .backgroundDefaultInput)
        .cornerRadius(10)
        .shadow(
            color: .typePsychic.opacity(isSelected ? 0.3 : 0),
            radius: 20,
            y: 10
        )
        
    }
}

#Preview {
    GenerationButton(
        generation: .II,
        isSelected: true
    )
}
