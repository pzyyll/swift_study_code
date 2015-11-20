//
//  ViewController.swift
//  FirstIOS
//
//  Created by pzyyll on 15/11/13.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var v1: UIView?
    var v2: UIView?
    
    override func loadView() {
        super.loadView()
        //print(__FUNCTION__)
        v1 = UIView(frame: CGRectMake(100, 120, 140, 160))
        self.view.addSubview(v1!)
        
        v2 = UIView(frame: CGRectMake(20, 40, 60, 80))
        
        v1?.addSubview(v2!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //print(__FUNCTION__)
        v1?.backgroundColor = UIColor.blueColor()
        v2?.backgroundColor = UIColor.redColor()
        print("v1 frame: \(v1?.frame)")
        print("v1 bounds: \(v1?.bounds)")
        print("v1 center: \(v1?.center)")
        
        v1?.bounds.size = CGSize(width: 280, height: 320)
        v1?.bounds.origin = CGPoint(x: 50, y: 50)
        print("v1 frame: \(v1?.frame)")
        print("v1 bounds: \(v1?.bounds)")
        print("v1 center: \(v1?.center)")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //print(__FUNCTION__)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //print(__FUNCTION__)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //print(__FUNCTION__)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //print(__FUNCTION__)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

