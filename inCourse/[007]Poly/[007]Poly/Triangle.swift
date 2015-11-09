//
//  Triangle.swift
//  [007]Poly
//
//  Created by CAIZHILI on 15/11/8.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

class Triangle: PolygonShape {
    var a = 0.0, b = 0.0, c = 0.0
    
    init() {}
    init(a: Double, b: Double, c: Double) {
        self.a = a;
        self.b = b;
        self.c = c;
    }
    
    func getTotalSideLengh() -> Double {
        return a + b + c;
    }
    
}