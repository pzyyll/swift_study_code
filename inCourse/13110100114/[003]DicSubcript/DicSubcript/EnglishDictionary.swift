//
//  EnglishDictionary.swift
//  DicSubcript
//
//  Created by pzyyll on 15/11/6.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import Foundation

import Foundation

struct EnglishDictionary {
    let wordsAndDefinitions = [
        "go" : "vi. 走；达到；运转；趋于",
        "come" : "vi. 来；开始；出现；发生；变成；到达",
        "Voltaire" : "n. 伏尔泰（法国启蒙思想家、哲学家、作家、历史学家）"
    ]
    
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