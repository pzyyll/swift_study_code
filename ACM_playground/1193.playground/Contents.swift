//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1193

for i in 1...1000 {
    var sum = 0
    var rComMultStr = "="
    for var j = 1; j < i; ++j {
        if i % j == 0 {
            sum += j
            rComMultStr += "\(j)+"
        }
    }
    rComMultStr.removeAtIndex(rComMultStr.endIndex.predecessor())
    if i == sum {
        print("\(i)" + rComMultStr)
    }
}