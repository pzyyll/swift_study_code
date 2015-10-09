//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
//1198

var inputArrA = [2,3,4,5,6,7]
var inputArrB = [3,5,7,9,11,13,15,19]

for i in 0..<inputArrA.count {
    for iA in 0..<inputArrB.count {
        if inputArrA[i] == inputArrB[iA] {
            print(inputArrA[i])
        }
    }
}