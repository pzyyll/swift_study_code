//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1168

var inputStr = "aklsjflj123 sadf918u324 asdf91u32oasdf/.';123"

var cnt = ["alph" : 0, "space" : 0, "num" : 0, "other" : 0]

for char in inputStr.characters {
    switch char {
        case "a"..."z":
            fallthrough
        case "A"..."Z":
            ++cnt["alph"]!
        case " ":
            ++cnt["space"]!
        case "0"..."9":
            ++cnt["num"]!
    default:
        ++cnt["other"]!
    }
}

print(cnt)

