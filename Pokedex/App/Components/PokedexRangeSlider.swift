//
//  PokedexRangeSlider.swift
//  Pokedex
//
//  Created by João Melo on 24/05/24.
//

import SwiftUI

struct PokedexRangeSlider: View {
    @Binding var currentValue: ClosedRange<Int>
    let sliderBounds: ClosedRange<Int>
    
    var body: some View {
        GeometryReader {geometry in
            sliderView(sliderSize: geometry.size)
        }
    }
    
    @ViewBuilder private func sliderView(sliderSize: CGSize) -> some View {
        let sliderViewYCenter = sliderSize.height / 2
        
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(.backgroundDefaultInput)
                .frame(height: 4)
                .cornerRadius(2)
            ZStack {
                let sliderBoundDifference = sliderBounds.count
                let stepWidthInPixel = CGFloat(sliderSize.width) / CGFloat(sliderBoundDifference)
                
                //Calculate Left Thumb initial position
                let leftThumbLocation: CGFloat = currentValue.lowerBound == sliderBounds.lowerBound
                ? 0
                : CGFloat(currentValue.lowerBound - sliderBounds.lowerBound) * stepWidthInPixel
                
                //Calculate right thumb initial position
                let rightThumbLocation = CGFloat(currentValue.upperBound - sliderBounds.lowerBound) * stepWidthInPixel
                
                //Line between
                lineBetweenThumbs(
                    from: .init(x: leftThumbLocation, y: sliderViewYCenter),
                    to: .init(x: rightThumbLocation, y: sliderViewYCenter)
                )
                
                //Left Thumb Handle
                let leftThumbPoint = CGPoint(x: leftThumbLocation, y: sliderViewYCenter)
                thumbView(position: leftThumbPoint, value: currentValue.lowerBound)
                    .highPriorityGesture(DragGesture().onChanged { dragValue in
                        let dragLocation = dragValue.location
                        let xThumbOffset = min(max(0, dragLocation.x), sliderSize.width)
                        
                        let newValue = sliderBounds.lowerBound + Int(xThumbOffset / stepWidthInPixel)
                        
                        if newValue < currentValue.upperBound {

                            currentValue = newValue...currentValue.upperBound
                        }
                    })
                
                //Right Thumb Handle
                let rightThumbPoint = CGPoint(x: rightThumbLocation, y: sliderViewYCenter)
                thumbView(position: rightThumbPoint, value: currentValue.upperBound)
                    .highPriorityGesture(DragGesture().onChanged { dragValue in
                        let dragLocation = dragValue.location
                        let xThumbOffset = min(max(CGFloat(leftThumbLocation), dragLocation.x), sliderSize.width)
                        
                        var newValue = Int(xThumbOffset / stepWidthInPixel)
                        newValue = min(newValue, sliderBounds.count) + sliderBounds.lowerBound
                        
                        if newValue > currentValue.lowerBound {
                            currentValue = currentValue.lowerBound...newValue
                        }
                    })
            }
        }
    }
    
    @ViewBuilder private func lineBetweenThumbs(from: CGPoint, to: CGPoint) -> some View {
        Path { path in
            path.move(to: from)
            path.addLine(to: to)
        }
        .stroke(.typePsychic, lineWidth: 4)
    }
    
    @ViewBuilder private func thumbView(position: CGPoint, value: Int) -> some View {
        ZStack {
            Text(String(value))
                .font(TextStyles.pokemonType)
                .foregroundColor(.textGray)
                .offset(y: 30
                    )
                
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.textWhite)
                .shadow(color: .typePsychic.opacity(0.3), radius: 4, y: 10)
                .overlay(
                    Circle()
                        .stroke(.typePsychic, lineWidth: 4)
                )
        }
        .position(x: position.x, y: position.y)
    }
}

#Preview {
    struct ContainderView: View {
        @State var sliderPosition: ClosedRange<Int> = 152...252
        
        var body: some View {
            PokedexRangeSlider(
                currentValue: $sliderPosition,
                sliderBounds: 152...252
            )
            .padding()
        }
    }
    
    return ContainderView()
}
