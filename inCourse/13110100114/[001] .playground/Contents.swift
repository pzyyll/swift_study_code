//: Playground - noun: a place where people can play

import UIKit


//使用Xcode7.0以上版本

var str = "fkit.orgabcxyz123crazyittianhijt"
var dic = [Character: Int]()

for char in str.characters {
    if dic[char] != nil {
        ++dic[char]!
    } else {
        dic[char] = 1
    }
}

var maxKey = dic.keys.first
for (key, val) in dic {
    if val > dic[maxKey!] {
        maxKey = key
    }
}

//输出出现次数最大的
for (key, val) in dic {
    if val == dic[maxKey!] {
        print("\(key) : \(val)")
    }
}
