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
            
            Image("Image6x3")
                .resizable()
                .frame(maxWidth: 74, maxHeight: 32)
                .position(x:127, y: 21)
                .mask {
                    LinearGradient(
                        colors: [
                             .textWhite.opacity(0.3),
                             .textWhite.opacity(0)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    
                }
            
            LinearGradient(
                colors: [
                     .textWhite.opacity(0.3),
                     .textWhite.opacity(0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(width: 74, height: 32)
            
            
            
            PokedexRangeSlider(currentValue: $sliderPosition, sliderBounds: 1...151)
            //.titleStyle()
            //.font(.title)
            
        }
        .background(.black)
        .padding()
    }
}

#Preview {
    ContentView()
}
