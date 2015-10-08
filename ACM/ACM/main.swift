//
//  main.swift
//  1041ACM
//
//  Created by CAIZHILI on 15/9/25.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

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


/*
//1196
var inputNumArr = [Int]()

srandom(UInt32(time(nil)))
for i in 0..<20 {
inputNumArr.append(random() % 100)
print(inputNumArr[i], terminator: " ")
}
print("")


for i in 0..<inputNumArr.count {
for iA in 0..<inputNumArr.count {
if iA != i &&
inputNumArr[i] % inputNumArr[iA] == 0 {
print(inputNumArr[i])
break
}
}
}
*/
//1195
/*
var inputNumArr = [Int]()
srandom(UInt32(time(nil)))

for i in 0..<10 {
inputNumArr.append(random() % 100)
print(inputNumArr[i], terminator: " ")
}

print("")

for i in 0..<(inputNumArr.count - 1) {
var minIndex = i
for var j = i + 1; j < inputNumArr.count; ++j {
if inputNumArr[minIndex] > inputNumArr[j] {
minIndex = j
}
}
if i != minIndex {
let temp = inputNumArr[i]
inputNumArr[i] = inputNumArr[minIndex]
inputNumArr[minIndex] = temp
}
}

for i in 0..<inputNumArr.count {
print(inputNumArr[i])
}
*/
//5 4 8 2 1
/*
//1194
let Pi = 3.1415926535

for i in 1...10 {
let area = Double(i * i) * Pi
if area > 40 && area < 90 {
print(String(format: "r=%d area=%.2f", arguments: [i, area]))
}
}
*/
/*
//1193

for i in 1...1000 {
var sum = 0
var rComMultStr = "="
for var j = 1; j < i; ++j {
if i % j == 0 {
sum += j
rComMultStr += "\(j)+"
}
}
rComMultStr.removeAtIndex(rComMultStr.endIndex.predecessor())
if i == sum {
print("\(i)" + rComMultStr)
}
}
*/
/*
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
*/
/*
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
*/


/*
//1184

for i in 10...1000 {
if (i % 2 == 0 &&
i % 3 == 0 &&
i % 7 == 0) {
print(i)
}
}
*/
/*
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
*/
/*
//1174

var inputNum = 5
var res = 0.0

if inputNum < 0 {
res = Double(abs(inputNum))
} else if inputNum >= 0 && inputNum < 2 {
res = sqrt(Double(inputNum + 1))
} else if inputNum >= 2 && inputNum < 4 {
res = Double(inputNum + 2) * Double(inputNum + 2) *
Double(inputNum + 2)
} else {
res = Double(inputNum * 2 + 5)
}

print(String(format: "%.2f", arguments: [res]))
*/
/*
//1172
var inputNumArr = [Int]()
srandom(UInt32(time(nil)))

var sum = 0
var absMinIndex = 0
for i in 0..<10 {
var newNum = random() % 150 - 50
inputNumArr.append(newNum)
print("\(inputNumArr[i]) ", terminator: "")
if (abs(inputNumArr[absMinIndex]) > abs(inputNumArr[i])) {
absMinIndex = i
}
}
print("")

var temp = inputNumArr[9]
inputNumArr[9] = inputNumArr[absMinIndex]
inputNumArr[absMinIndex] = temp

for i in 0..<10 {
print("\(inputNumArr[i]) ", terminator: "")
}
print("")
*/

/*
//1170
var inputNumArr = [Int]()

srandom(UInt32(time(nil)))

var sum = 0
for i in 0..<10 {
var newNum = random() % 1000
inputNumArr.append(newNum)
print("\(inputNumArr[i]) ", terminator: "")
sum += newNum
}
var ave = Double(sum) / 10
var cnt = 0

for i in 0..<10 {
if Double(inputNumArr[i]) > ave {
++cnt
}
}

print("\n\(cnt)")
*/

/*
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
*/

/*
//1062
var nArr: [Int] = []//= [4, 85, 3, 234, 45, 345, 345, 122,30, 12]

srandom(UInt32(time(nil)))
for i in 0..<10 {
let ranNum = random() % 1000
nArr.append(ranNum);
}

for i in 0..<(nArr.count - 1) {
//var min = nArr[i]
var min_index = i
for var j = i + 1; j < nArr.count; ++j {
if nArr[j] < nArr[min_index] {
//min = nArr[j]
min_index = j
}
}
if i != min_index {
let t = nArr[i]
nArr[i] = nArr[min_index]
nArr[min_index] = t
}
}

for i in 0..<nArr.count {
print(nArr[i])
}
*/
/*
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
*/
/*
//1056
var inputNum = 1000

for inNum in 2...1000 {
var sum = 0
for x in 1..<inNum {
if inNum % x == 0 {
sum += x
}
}
if inNum == sum {
print("\(inNum) its factors are ", terminator: "")
for x in 1..<inNum {
if inNum % x == 0 {
print("\(x) ", terminator: "")
}
}
print("")
}
}
*/
/*
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
*/
/*
//1042
func converChar(var c: Character) -> Character {
let t = String(c)
for var uni in t.utf8 {
uni += 4
c = Character(UnicodeScalar(uni))
}
return c
}

var c1: Character = "C"
var c2: Character = "h"
var c3: Character = "i"
var c4: Character = "n"
var c5: Character = "a"

c1 = converChar(c1)
c2 = converChar(c2)
c3 = converChar(c3)
c4 = converChar(c4)
c5 = converChar(c5)

print("\(c1)\(c2)\(c3)\(c4)\(c5)")
*/

/*
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
*/
