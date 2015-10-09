//: Playground - noun: a place where people can play

import UIKit

//1041
var a = 30  //c_inputNum()
var b = 3   //c_inputNum()
var c = 85  //c_inputNum()
var max = 0

if (a > b) && (a > c) {
    max = a
} else {
    max = b > c ? b : c
}

print(max)

