//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1186

var a = 4, b = 14

if a > b {
    var temp = a
    a = b
    b = temp
}
var ta = a
var tb = b

while (tb % ta != 0) {
    var r = tb % ta
    tb = ta
    ta = r
}
var minComMult = a * b / ta

print(ta)
print(minComMult)
