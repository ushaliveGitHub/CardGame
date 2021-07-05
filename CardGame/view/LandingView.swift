//
//  LandingView.swift
//  CardGame
//
//  Created by Usha Natarajan on 7/5/21.
//

import SwiftUI
import Combine

struct LandingView: View {
    @ObservedObject var viewModel: EmojiModel
    @State var degrees:Double = 0.0
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(viewModel.cards, id:\.id) { card in
                        CardView(card: card, degrees: $degrees).aspectRatio(2/3, contentMode: .fit)
                            .animation(.easeOut(duration: 0.5))
                            .onTapGesture(perform: {
                                self.degrees = 180
                                viewModel.choose(card)
                            })
                    }
                }
            }
            Spacer()
        }
    }
}


struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiModel()
        Group {
            LandingView(viewModel: game).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            LandingView(viewModel: game).preferredColorScheme(.light)
        }
    }
}
