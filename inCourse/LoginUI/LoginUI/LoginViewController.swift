//
//  LoginViewController.swift
//  LoginUI
//
//  Created by pzyyll on 15/11/20.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    var labelUsername: UILabel!
    var labelPwd: UILabel!
    var textUsername: UITextField!
    var textPwd: UITextField!
    
    var btnLogin: UIButton!
    var btnReg: UIButton!
    var btnForgetPws: UIButton!
    
    var switchPwd: UISwitch!
    
    override func loadView() {
        super.loadView()
        
        var rect = CGRectMake(20, 200, 80, 30)
        
        labelUsername = UILabel(frame: rect)
        
        rect.origin = labelUsername.frame.origin
        rect.origin.x += labelUsername.frame.width + 20
        rect.size.width = 200
        textUsername = UITextField(frame: rect)
        

        rect.origin = labelUsername.frame.origin
        rect.origin.y += labelUsername.frame.height + 10
        rect.size = labelUsername.frame.size
        labelPwd = UILabel(frame: rect)
        
        
        rect.origin = labelPwd.frame.origin
        rect.origin.x = textUsername.frame.origin.x
        rect.size = textUsername.frame.size
        textPwd = UITextField(frame: rect)
        
        rect.origin = textPwd.frame.origin
        rect.origin.y += rect.size.height + 15
        rect.size = textPwd.frame.size
        rect.size.width = rect.size.width / 2 - 10;
        btnLogin = UIButton(frame: rect)
        
        rect.origin.x += rect.size.width + 20
        btnReg = UIButton(frame: rect)
        
        rect.origin = textPwd.frame.origin
        rect.origin.x += textPwd.frame.size.width + 5
        rect.size.width = 50
        switchPwd = UISwitch(frame: rect)
        
        self.view.addSubview(labelUsername)
        self.view.addSubview(labelPwd)
        self.view.addSubview(textUsername)
        self.view.addSubview(textPwd)
        self.view.addSubview(btnLogin)
        self.view.addSubview(btnReg)
        self.view.addSubview(switchPwd)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.greenColor()
        
        labelUsername.text = "User Name"
        labelUsername.textColor = UIColor.blackColor()
        labelUsername.textAlignment = NSTextAlignment.Right
        labelUsername.font = UIFont.systemFontOfSize(15)
        
        
        labelPwd.text = "Passwd"
        labelPwd.textColor = UIColor.blackColor()
        labelPwd.textAlignment = NSTextAlignment.Right
        labelPwd.font = UIFont.systemFontOfSize(15)
        
        textUsername.borderStyle = .RoundedRect
        textUsername.placeholder = "Please enter user name"
        textUsername.returnKeyType = .Next
        textUsername.clearButtonMode = UITextFieldViewMode.WhileEditing
        textUsername.delegate = self
        
        textPwd.borderStyle = UITextBorderStyle.RoundedRect
        textPwd.delegate = self
        textPwd.secureTextEntry = true
        
        btnLogin.setTitle("Login", forState: .Normal)
        btnLogin.backgroundColor = UIColor.blueColor()
        btnLogin.addTarget(self, action: Selector("login"), forControlEvents: UIControlEvents.TouchUpInside)
        
        btnReg.setTitle("Sign Up", forState: .Normal)
        btnReg.backgroundColor = UIColor.blueColor()
        
        switchPwd.addTarget(self, action: Selector("switch_pwd_appear"), forControlEvents: UIControlEvents.ValueChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textUsername.resignFirstResponder()
        textPwd.resignFirstResponder()
        return true;
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if (textUsername.text!.isEmpty || textPwd.text!.isEmpty) {
            btnLogin.enabled = false
            btnLogin.backgroundColor = UIColor.darkGrayColor()
        } else {
            btnLogin.enabled = true
            btnLogin.backgroundColor = UIColor.blueColor()
        }
    }
    
    func login() {
        print("it's login");
        let alertView = UIAlertView(title: "Warn", message: "功能暂时无", delegate: self, cancelButtonTitle: "确定")
        alertView.show()
    }
    
    func switch_pwd_appear() {
        if switchPwd.on {
            textPwd.secureTextEntry = true
        } else {
            textPwd.secureTextEntry = false
        }
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
