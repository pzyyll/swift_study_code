//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1174

var inputNum = 5
var res = 0.0

if inputNum < 0 {
    res = Double(abs(inputNum))
} else if inputNum >= 0 && inputNum < 2 {
    res = sqrt(Double(inputNum + 1))
} else if inputNum >= 2 && inputNum < 4 {
    res = Double(inputNum + 2) * Double(inputNum + 2) *
        Double(inputNum + 2)
} else {
    res = Double(inputNum * 2 + 5)
}

print(String(format: "%.2f", arguments: [res]))
