//
//  Typography.swift
//  Pokedex
//
//  Created by João Melo on 23/05/24.
//

import SwiftUI

struct TextStyles {
    static let title = Font.custom("SFProDisplay-Bold", size: 100)
    static let aplicationTitle = Font.custom("SFProDisplay-Bold", size: 32)
    static let pokemonName = Font.custom("SFProDisplay-Bold", size: 26)
    static let filterTitle = Font.custom("SFProDisplay-Bold", size: 16)
    static let description = Font.custom("SFProDisplay-Regular", size: 16)
    static let pokemonNumber = Font.custom("SFProDisplay-Bold", size: 12)
    static let pokemonType = Font.custom("SFProDisplay-Medium", size: 12)
}

extension Text {
    func titleStyle() -> some View {
        self.font(TextStyles.title)
    }
    
    func aplicationTitleStyle() -> some View {
        self.font(TextStyles.aplicationTitle)
    }
    
    func pokemonNameStyle() -> some View {
        self.font(TextStyles.pokemonName)
    }
    
    func filterTitleStyle() -> some View {
        self.font(TextStyles.filterTitle)
    }
    
    func descriptionStyle() -> some View {
        self.font(TextStyles.description)
    }
    
    func pokemonNumberStyle() -> some View {
        self.font(TextStyles.pokemonNumber)
    }
    
    func pokemonTypeStyle() -> some View {
        self.font(TextStyles.pokemonType)
    }
}
