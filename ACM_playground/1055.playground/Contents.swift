//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1055

for num in 100..<1000 {
    var res = 0
    var t_num = num
    repeat {
        var num_s = t_num % 10
        t_num /= 10
        res += num_s * num_s * num_s
    } while t_num > 0
    if res == num {
        print(num)
    }
}