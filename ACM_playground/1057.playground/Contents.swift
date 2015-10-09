//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1057

var inputN = 10
var r = 2.0, d = 1.0
var sum = 0.0
for i in 0..<inputN {
    sum += r / d
    var rPre = r
    r += d
    d = rPre
}
print(String(format: "%0.2lf", sum))
