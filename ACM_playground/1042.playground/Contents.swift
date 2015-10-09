//: Playground - noun: a place where people can play

import UIKit

//1042,使用最新xcode, 7.0以上版本

func converChar(var c: Character) -> Character {
    let t = String(c)
    for var uni in t.utf8 {
        uni += 4
        c = Character(UnicodeScalar(uni))
    }
    return c
}

var c1: Character = "C"
var c2: Character = "h"
var c3: Character = "i"
var c4: Character = "n"
var c5: Character = "a"

c1 = converChar(c1)
c2 = converChar(c2)
c3 = converChar(c3)
c4 = converChar(c4)
c5 = converChar(c5)

print("\(c1)\(c2)\(c3)\(c4)\(c5)")
