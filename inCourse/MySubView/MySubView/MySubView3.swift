//
//  MySubView3.swift
//  MySubView
//
//  Created by pzyyll on 15/11/20.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class MySubView3: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("In began 3 " + (__FILE__) + __FUNCTION__)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("In moved 3 " + __FILE__ + __FUNCTION__)
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        print("in cancelled 3 " + __FILE__ + __FUNCTION__)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("In ended 3 " + __FILE__ + __FUNCTION__)
    }
}
