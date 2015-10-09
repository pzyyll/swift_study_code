//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1170
var inputNumArr = [Int]()

srandom(UInt32(time(nil)))

var sum = 0
for i in 0..<10 {
    var newNum = random() % 1000
    inputNumArr.append(newNum)
    print("\(inputNumArr[i]) ", terminator: "")
    sum += newNum
}
var ave = Double(sum) / 10
var cnt = 0

for i in 0..<10 {
    if Double(inputNumArr[i]) > ave {
        ++cnt
    }
}

print("\n\(cnt)")

