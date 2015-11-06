//
//  File.swift
//  Calculate
//
//  Created by pzyyll on 15/11/6.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import Foundation

class Calculation {
    var a = 0;
    var b = 0;
    
    var sum: Int {
        return a + b
    }
    var sub: Int {
        return a - b
    }
    var pro: Int {
        return a * b
    }
    var divi: Int {
        if (b == 0) {
            print("除数不能为0！");
            return 0;
        } else {
            return a / b
        }
        
    }
}