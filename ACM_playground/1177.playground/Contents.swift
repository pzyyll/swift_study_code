//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1177


var inputNum = [88, 71, 68, 70, 59, 81, 91, 42, 66, 77, 83, 0]
var first = 0, sec = 0, third = 0;


for i in inputNum {
    if i == 0 {
        break
    }
    if i >= 85 {
        ++first
    } else if i >= 60 && i <= 84 {
        ++sec
    } else {
        ++third
    }
}

print(">=85:\(first)")
print("60-84:\(sec)")
print("<60:\(third)")