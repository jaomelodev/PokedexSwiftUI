//
//  PokedexInput.swift
//  Pokedex
//
//  Created by João Melo on 24/05/24.
//

import SwiftUI

struct PokedexInput: View {
    @Binding var text: String
    var placeHolder: String
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Image("IconSearch")
                .padding([.trailing], 5)
            TextField(text: $text) {
                Text(placeHolder)
                    .font(TextStyles.description)
                    .foregroundColor(.textGray)
            }
            .font(TextStyles.description)
            .foregroundColor(.textBlack)
            .accentColor(.typePsychic)
        }
        .padding([.bottom, .top], 20)
        .padding([.trailing, .leading], 25)
        .background(isFocused ? .backgroundPressedInput : .backgroundDefaultInput)
        .focused($isFocused)
        .cornerRadius(10)
    }
}

#Preview {
    PokedexInput(
        text: .constant(""),
        placeHolder: "What Pokémon are you looking for?"
    )
}
