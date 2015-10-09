//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1172

var inputNumArr = [Int]()
srandom(UInt32(time(nil)))

var sum = 0
var absMinIndex = 0
for i in 0..<10 {
    var newNum = random() % 150 - 50
    inputNumArr.append(newNum)
    print("\(inputNumArr[i]) ", terminator: "")
    if (abs(inputNumArr[absMinIndex]) > abs(inputNumArr[i])) {
        absMinIndex = i
    }
}
print("")

var temp = inputNumArr[9]
inputNumArr[9] = inputNumArr[absMinIndex]
inputNumArr[absMinIndex] = temp

for i in 0..<10 {
    print("\(inputNumArr[i]) ", terminator: "")
}
print("")

