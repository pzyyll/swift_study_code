//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1194

let Pi = 3.1415926535

for i in 1...10 {
    let area = Double(i * i) * Pi
    if area > 40 && area < 90 {
        print(String(format: "r=%d area=%.2f", arguments: [i, area]))
    }
}