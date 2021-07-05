//
//  GameModel.swift
//  CardGame
//
//  Created by Usha Natarajan on 7/5/21.
//

import Foundation

struct GameModel<CardContent> where CardContent: Equatable { // Generic Model
    
    struct Card {
        var content: CardContent //generic type
        var id: UUID
        var faceUp: Bool = false
    }
    
    private (set) var cards: Array<Card>
    private var faceUpCard: Int?
    private var matched:Bool = false
    
    init(numberOfPairs: Int, createContent:(Int) -> CardContent) {
        cards = Array<Card>() // empty array
        
        for index in 0..<numberOfPairs {
            let content = createContent(index)
            cards.append(Card(content: content, id: UUID()))
            cards.append(Card(content: content, id: UUID()))
        }
        cards.shuffle() //shuffle the cards so pairs are not next to each other
    }
    
    
    mutating func choose(_ card: Card) {
        /**
            if card is already selected and faceup and matched then skip. This is prevent any action on already selected card.
         */
        guard let selected = cards.firstIndex(where: { $0.id == card.id } ),
              !cards[selected].faceUp else {
            return
        }
        
        /**
            If (previously) selected card and current faceup cards match delete them
         */
        if let potentialMatch = faceUpCard {
            if cards[selected].content == cards[potentialMatch].content {
                cards.remove(at:selected)
                if potentialMatch < selected {
                    cards.remove(at: potentialMatch)
                }else{
                    cards.remove(at: potentialMatch - 1)
                }
            }
            matched = true
            faceUpCard = nil  //reset faceUp Card
        }else{
            /**
                If there is no match then flip all the cards facedown except the current faceup Card
             */
            for index in cards.indices { //
                cards[index].faceUp = false
            }
            faceUpCard = selected
        }
       
        if selected < cards.count {
            cards[selected].faceUp.toggle()
        }
    }
}
