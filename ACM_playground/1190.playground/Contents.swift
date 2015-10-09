//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1190

func isPrime(num: Int) -> Bool {
    if (num < 2) {
        return false
    }
    for var i = 2; i * i <= num; ++i {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}

var inputNum = 1800

while (inputNum != 1) {
    var i = 2
    while (true) {
        if (inputNum % i == 0 && isPrime(i)) {
            print("\(i) ", terminator: "")
            inputNum /= i
            break
        }
        ++i
    }
}
print("")
