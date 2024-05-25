//
//  ContentView.swift
//  Pokedex
//
//  Created by João Melo on 23/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var sliderPosition: ClosedRange<Int> = 14...140
    
    var body: some View {
        VStack {
            Image("IconSearch")
                .foregroundColor(.blue)
                .imageScale(.large)
                
            Text("Hello, world!")
                .pokemonNumberStyle()
                .foregroundColor(.typeBug)
            
            PokedexRangeSlider(currentValue: $sliderPosition, sliderBounds: 1...151)
            //.titleStyle()
            //.font(.title)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
