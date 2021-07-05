//
//  EmojiModel.swift
//  CardGame
//
//  Created by Usha Natarajan on 7/4/21.
//

import SwiftUI

class EmojiModel: ObservableObject {
    static let emojis = [ "👏🏼", "🤝", "👍"," 👎",
                          "👊", "✊", "🤛", "🤜",
                          "🤞", "✌️", "🤟", "🤘",
                          "👌","🤌🏻","🤏","👈",
                          "👉","👆","👇","☝️",
                          "✋","🖐","🖖","🤙"]
    @Published private var model: GameModel<String> = GameModel(numberOfPairs: 4) { index in
        return emojis[index]
    }
    
    var cards: Array<GameModel<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: GameModel<String>.Card) {
        model.choose(card)
    }
}
