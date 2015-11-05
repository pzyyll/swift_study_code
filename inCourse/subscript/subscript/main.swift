//
//  main.swift
//  subscript
//
//  Created by CAIZHILI on 15/11/5.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

print("务必要使用Xcode7正式版啊！")
print("务必要使用Xcode7正式版啊！")
print("务必要使用Xcode7正式版啊！")
print("重要的事情说三遍！！！")

struct EnglishDictionary {
    let wordsAndDefinitions = [ "go" : "vi. 走；达到；运转；趋于",
        "come" : "vi. 来；开始；出现；发生；变成；到达",
        "Voltaire" : "n. 伏尔泰（法国启蒙思想家、哲学家、作家、历史学家）"
    ]
    
//    func loopMember(){
//        for (_, member) in wordsAndDefinitions {
//            print(member)
//        }
//    }
//    
    subscript(index: Int) -> String {
        assert(index < wordsAndDefinitions.count, "Index out of range")
        var i = 0;
        var reStr = "";
        for (_, val) in self.wordsAndDefinitions {
            if (i++ == index) {
                reStr = val;
                break;
            }
        }
        
        return reStr;
    }
}

let aDicStruct = EnglishDictionary()

print(aDicStruct.wordsAndDefinitions["go"])

print(aDicStruct[0])
print(aDicStruct[1])
