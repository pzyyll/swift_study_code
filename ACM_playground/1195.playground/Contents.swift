//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1195

var inputNumArr = [Int]()
srandom(UInt32(time(nil)))

for i in 0..<10 {
    inputNumArr.append(random() % 100)
    print(inputNumArr[i], terminator: " ")
}

print("")

for i in 0..<(inputNumArr.count - 1) {
    var minIndex = i
    for var j = i + 1; j < inputNumArr.count; ++j {
        if inputNumArr[minIndex] > inputNumArr[j] {
            minIndex = j
        }
    }
    if i != minIndex {
        let temp = inputNumArr[i]
        inputNumArr[i] = inputNumArr[minIndex]
        inputNumArr[minIndex] = temp
    }
}

for i in 0..<inputNumArr.count {
    print(inputNumArr[i])
}
