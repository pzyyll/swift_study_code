//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1056

for inNum in 2...1000 {
    var sum = 0
    for x in 1..<inNum {
        if inNum % x == 0 {
            sum += x
        }
    }
    if inNum == sum {
        print("\(inNum) its factors are ", terminator: "")
        for x in 1..<inNum {
            if inNum % x == 0 {
                print("\(x) ", terminator: "")
            }
        }
        print("")
    }
}
