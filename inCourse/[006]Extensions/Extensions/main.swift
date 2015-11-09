//
//  main.swift
//  Extensions
//
//  Created by pzyyll on 15/11/6.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import Foundation


extension String {
    func getVowelCount() -> Int {
        var cnt = 0
        for char in self.characters {
            switch char {
                case "a","e","i","o","u":
                fallthrough
                case "A", "E", "I", "O", "U":
                ++cnt
            default:
                break
            }
        }
        
        return cnt
    }
    
    func getOtherCount() -> Int {
        var cnt = 0
        for char in self.characters {
            switch char {
                case "a"..."z":
                    break;
                case "A"..."Z":
                    break;
            default:
                ++cnt
            }
        }
        return cnt
    }
    
    func getConsoCount() -> Int {
        var cnt = self.characters.count
        cnt = cnt - self.getVowelCount() - self.getOtherCount()
        
        return cnt
    }
}

let test = "abcdefgh09***A。。。"

print(test.characters.count)
print(test.getConsoCount())
print(test.getVowelCount())
print(test.getOtherCount())