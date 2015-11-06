//
//  main.swift
//  poker
//
//  Created by CAIZHILI on 15/11/5.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation


let onePoker = Pokers()
let aPokerHaveJorker = Pokers(joker: .haveJoker)
print(onePoker.stock)
print(aPokerHaveJorker.stock)

for i in 0..<onePoker.stock {
    print(onePoker[i].flowerAndVal)
}

for i in 0..<aPokerHaveJorker.stock {
    print(aPokerHaveJorker[i].flowerAndVal)
}
aPokerHaveJorker.cards.removeFirst()

let playerA = Player(name: "a")
playerA.getPoker(onePoker, num: 13)

print("\n\(playerA.cards.count)")
for i in playerA.cards {
    print(i.flowerAndVal, terminator: " ")
    //print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)
}
print("")

Player.bSort(playerA)

for i in playerA.cards {
    print(i.flowerAndVal, terminator: " ")
    //print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)
}
print("")

print(onePoker.stock)

let playerB = Player(name: "b", pokers: onePoker)
for i in playerB.cards {
    print(i.flowerAndVal, terminator: " ")
    //print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)
}
print("")

print(onePoker.stock)