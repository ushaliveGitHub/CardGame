//
//  CardView.swift
//  CardGame
//
//  Created by Usha Natarajan on 7/4/21.
//

import SwiftUI

struct CardView: View {
    var card: GameModel<String>.Card
    @Binding var degrees: Double
    
    var body: some View {
        ZStack {
            let rectShape = RoundedRectangle(cornerRadius: 20)
            if card.faceUp{
                rectShape
                    .fill()
                    .foregroundColor(.white)
                rectShape
                    .strokeBorder(lineWidth: 0.5)
                Text(card.content)
                    .font(.largeTitle)
            }else{
                rectShape
                    .fill(RadialGradient(gradient: .init(colors: [Color.yellow, Color.pink]),
                          center: .center,
                          startRadius: 1.0,
                          endRadius: 100))
            }
        }.rotation3DEffect(.degrees(card.faceUp ? degrees : 0.0), axis: (x:0, y:1, z:0))
        .padding(10)
    }
}
