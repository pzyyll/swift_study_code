//
//  Square.swift
//  [007]Poly
//
//  Created by CAIZHILI on 15/11/8.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

class Square: PolygonShape {
    var sideLength = 0.0
    
    init() {}
    init(sideLength: Double) {
        self.sideLength = sideLength
    }
    
    func getTotalSideLengh() -> Double {
        return 4 * sideLength
    }
    
}