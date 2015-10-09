//
//  ViewController.swift
//  TestIOS
//
//  Created by pzyyll on 15/9/18.
//  Copyright (c) 2015年 pzyyll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var pwd: UITextField!
    
    @IBOutlet weak var login: UIButton!

    @IBOutlet weak var displayUP: UILabel!
    
    @IBAction func OnTouchBnLogin(sender: UIButton) {
        
        if userName.text.isEmpty {
            displayUP.text = "请输入密码！！"
            return
        }

        var user = (name: "admin", pwd: "123")
        if userName.text == user.name &&
            pwd.text == user.pwd {
                displayUP.text = "right"
        } else {
            displayUP.text = "error"
        }
        
        //print("name \(userName!) pwd \(pwd)")
    }
}


