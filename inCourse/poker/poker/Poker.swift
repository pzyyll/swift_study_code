//
//  Poker.swift
//  poker
//
//  Created by CAIZHILI on 15/11/5.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

class Poker {
    var flower = ""
    var value = 0
    
    var flowerAndVal: String {
        return flower + value.description
    }
    
    init() {}
    init(flower: String, value: Int) {
        self.flower = flower
        self.value = value
    }
    
}