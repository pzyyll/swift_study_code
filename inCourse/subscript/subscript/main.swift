//
//  main.swift
//  subscript
//
//  Created by CAIZHILI on 15/11/5.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

for _ in 0..<3 {
    print("务必要使用Xcode7正式版啊！")
}
print("重要的事情说三遍！！！")

let aDicStruct = EnglishDictionary()

print(aDicStruct.wordsAndDefinitions["go"])

print(aDicStruct[0])
print(aDicStruct[1])
