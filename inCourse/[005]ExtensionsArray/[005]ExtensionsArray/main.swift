//
//  main.swift
//  [005]ExtensionsArray
//
//  Created by CAIZHILI on 15/11/6.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation
import Swift


for _ in 0..<3 {
    print("使用xcode7.0正式版以上！！")
}
print("重要的事情说三遍~\n")

extension Array {
    func getSum() -> AnyObject? {
        assert(!self.isEmpty, "array is empty!")
        if self[0] is Int {
            var sum = self[0] as! Int
            for i in 1..<self.count {
                sum += self[i] as! Int
            }
            return sum
        }
        else if self[0] is Double {
            var sum = self[0] as! Double
            for i in 1..<self.count {
                sum += self[i] as! Double
            }
            return sum
        }
        else if self[0] is String {
            var sum = self[0] as! String
            for i in 1..<self.count {
                sum += self[i] as! String
            }
            return sum
        }
        return nil

    }
    
}

var anumArr = [1, 3, 4, 5, 6]
var afloatArr = [1.2, 2.2, 3.3]
var aStrArr = ["abc", "cba"]
var emptyArr = [Int]()

var num = anumArr.getSum()!
var flores = afloatArr.getSum()!
var str = aStrArr.getSum()!
//emptyArr.getSum()
print(num)
print(flores)
print(str)

