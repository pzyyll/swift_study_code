//
//  Player.swift
//  poker
//
//  Created by CAIZHILI on 15/11/5.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

class Player {
    var name = ""
    var cards = [Poker]()
    
    init(name: String) {
        self.name = name
    }
    init(name: String, pokers: Pokers) {
        self.name = name;
        {()->() in
            for _ in 0..<13 {
                let aRand = Int(arc4random()) % pokers.stock
                cards.append(pokers[aRand])
                pokers.removeAtIndex(aRand)
            }
        }()
    }
    
    func getPoker(pokers: Pokers, num: Int) {
        for _ in 0..<num {
            let aRand = Int(arc4random()) % pokers.stock
            cards.append(pokers[aRand])
            pokers.removeAtIndex(aRand)
        }
    }
    
    class func bSort(player: Player) {
        for i in 0..<(player.cards.count - 1){
            for iB in 0..<(player.cards.count - 1 - i) {
                if player.cards[iB].value <
                    player.cards[iB + 1].value {
                        let t = player.cards[iB]
                        player.cards[iB] = player.cards[iB + 1]
                        player.cards[iB + 1] = t
                }
            }
        }
    }
}