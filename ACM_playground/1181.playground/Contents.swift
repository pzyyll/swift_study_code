//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1181

var inputNum = 1.0
var res = 0.0

if inputNum < 1 {
    res = inputNum
} else if inputNum >= 1 && inputNum < 10 {
    res = inputNum * 2 - 1
} else {
    res = inputNum * 3 - 11
}

print(String(format: "%.2f", arguments: [res]))
