//
//  ViewController.swift
//  MySubView
//
//  Created by pzyyll on 15/11/20.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myView: MyView = MyView(frame: UIScreen.mainScreen().bounds)
        myView.backgroundColor = UIColor.whiteColor()
        
        let mySubView1: MySubView1 = MySubView1(frame: CGRectMake(0, 0, myView.bounds.width, myView.bounds.height / 3))
        mySubView1.backgroundColor = UIColor.greenColor()
        
        let mySubView2: MySubView2 = MySubView2(frame: CGRectMake(myView.bounds.width / 2, myView.bounds.height * 0.2, myView.bounds.width / 2, myView.bounds.height * 0.6))
        mySubView2.backgroundColor = UIColor.blueColor()
        
        let mySubView3: MySubView3 = MySubView3(frame: CGRectMake(0, myView.bounds.height * 0.8, myView.bounds.width, myView.bounds.height * 0.4))
        mySubView3.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(myView)
        self.view.addSubview(mySubView1)
        self.view.addSubview(mySubView2)
        self.view.addSubview(mySubView3)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

