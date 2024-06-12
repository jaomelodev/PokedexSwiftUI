//
//  PokedexButton.swift
//  Pokedex
//
//  Created by João Melo on 24/05/24.
//

import SwiftUI

struct PokedexButton: View {
    let buttonLable: String
    let disabled: Bool
    var primaryButton: Bool = true
    let action: () -> Void
    
    var body: some View {
        Button {
            if (!disabled) {
                action()
            }
        } label: {
            Text(buttonLable)
                .font(TextStyles.description)
                .frame(maxWidth: .infinity, maxHeight: 60)
                .frame(height: 60)
        }
        .background(
            disabled || !primaryButton ? .backgroundDefaultInput : .typePsychic
        )
        .foregroundColor(
            disabled || !primaryButton ? .textGray : .textWhite
        )
        .cornerRadius(10)
        .shadow(
            color: .textBlack.opacity(disabled || !primaryButton ? 0 : 0.25),
            radius: 4,
            y: 4
        )
        .disabled(disabled)
        .animation(.easeIn, value: primaryButton)
    }
}

#Preview {
    PokedexButton(
        buttonLable: "Selecionar",
        disabled: false,
        primaryButton: true
    ) {
        print("Clicou")
    }
}
