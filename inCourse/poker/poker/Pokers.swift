//
//  Pokers.swift
//  poker
//
//  Created by CAIZHILI on 15/11/5.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

class Pokers {
    let jokers = ["RedJoker", "BlackJoker"]
    let flowers = ["❤️", "♦️", "♠️", "♣️"]
    let values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1]
    enum HaveJoker {
        case haveJoker
        case noJoker
    }
    
    var cards = [Poker]()
    
    var stock: Int {
        return cards.count
    }
    
    init(joker: HaveJoker = .noJoker) {
        switch joker {
        case .haveJoker:
            for flower in flowers {
                for value in values {
                    cards.append(Poker(flower: flower, value: value))
                }
            }
            for joker in jokers {
                cards.append(Poker(flower: joker, value: 0))
            }
        case .noJoker:
            for flower in flowers {
                for value in values {
                    cards.append(Poker(flower: flower, value: value))
                }
            }
        }
    }
    
    subscript(index: Int) -> Poker {
        return cards[index]
    }
    
    func removeAtIndex(index: Int) -> Poker {
        let tempCard = cards[index]
        cards.removeAtIndex(index)
        
        return tempCard
    }
}