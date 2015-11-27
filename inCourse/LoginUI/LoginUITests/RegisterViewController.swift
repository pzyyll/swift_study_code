//
//  RegisterViewController.swift
//  LoginUI
//
//  Created by pzyyll on 15/11/27.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    var btn_BackLogin: UIButton!
    
    override func loadView() {
        super.loadView()
        
        var rect = CGRectMake(12, 12, 80, 80)
        btn_BackLogin = UIButton(frame: rect)
        
        self.view.addSubview(btn_BackLogin)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellowColor()
        
        btn_BackLogin.setTitle("Back", forState: .Normal)
        btn_BackLogin.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn_BackLogin.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btn_BackLogin.addTarget(self, action: Selector("backLogin"), forControlEvents: UIControlEvents.TouchUpInside)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backLogin() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
