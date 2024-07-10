//
//  StrokeText.swift
//  Pokedex
//
//  Created by João Melo on 19/06/24.
//

import SwiftUI

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color
    let font: Font

    var body: some View {
        ZStack {
            // Use the text view to calculate the size of the text
            Text(text)
                .font(font)
                .foregroundColor(.clear)
                .background(
                    GeometryReader { geo in
                        LinearGradient(
                            gradient: Gradient(
                                stops: [
                                    Gradient.Stop(
                                        color: .textWhite.opacity(0.3),
                                        location: 0
                                    ),
                                    Gradient.Stop(
                                        color: .textWhite.opacity(0),
                                        location: 0.76
                                    ),
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .mask {
                            ZStack {
                                Text(text).offset(x: width, y: width)
                                Text(text).offset(x: -width, y: -width)
                                Text(text).offset(x: -width, y: width)
                                Text(text).offset(x: width, y: -width)
                            }
                            .font(font)
                            .frame(width: geo.size.width, height: geo.size.height)
                        }
                    }
                )
            Text(text)
                .font(font)
                .foregroundColor(color)
        }
    }
}

#Preview {
    StrokeText(
        text: "TEST",
        width: 2,
        color: .backgroundBug,
        font: .system(size: 100)
    )
    .background(.backgroundBug)
}
