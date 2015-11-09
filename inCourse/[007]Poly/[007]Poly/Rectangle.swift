//
//  Rectangle.swift
//  [007]Poly
//
//  Created by CAIZHILI on 15/11/8.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

class Rectangle: PolygonShape {
    var length = 0.0
    var width = 0.0
    
    init() {}
    init(length: Double, width: Double) {
        self.length = length
        self.width = width
    }
    
    func getTotalSideLengh() -> Double {
        return 2 * (width + length)
    }
}