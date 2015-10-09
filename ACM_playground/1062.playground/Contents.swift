//: Playground - noun: a place where people can play

import UIKit

//使用最新xcode, 7.0以上版本
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
