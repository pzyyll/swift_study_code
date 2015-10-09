//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1196

var inputNumArr = [Int]()

srandom(UInt32(time(nil)))
for i in 0..<20 {
    inputNumArr.append(random() % 100)
    print(inputNumArr[i], terminator: " ")
}
print("")


for i in 0..<inputNumArr.count {
    for iA in 0..<inputNumArr.count {
        if iA != i &&
            inputNumArr[i] % inputNumArr[iA] == 0 {
                print(inputNumArr[i])
                break
        }
    }
}