//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Paull Stanley on 3/4/22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    static let emojis = ["✈️", "🚀", "🚗",  "🚙", "🚌", "🚜", "🚐", "🏍", "🛵", "🛴", "🚒", "🚢", "🚁", "🛺", "🚲", "🚟", "🚝", "🚞", "⛴", "🚔", "🏎", "🚊", "🚡", "🚖"]
    //static functions are type functions, they act on a type, not instances
    static func createMemoryGame()-> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex] }
    }
    
    //This acts on instances and not types
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards.shuffled()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
