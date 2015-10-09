//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1068

func is_prime(num: Int) -> Bool {
    if num < 2 {
        return false
    }
    
    var i = 2
    while (i * i <= num) {
        if (num % i == 0) {
            return false
        }
        ++i
    }
    return true
}


var inputNum = 4
if is_prime(inputNum) {
    print("prime")
} else {
    print("not prime")
}


