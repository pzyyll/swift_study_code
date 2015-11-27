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
    var btnNeedHelp: UIButton!
    
    var switchPwd: UISwitch!
    var imageView: UIImageView!
    
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
        btnLogin = UIButton(frame: rect)
        
        rect.origin = btnLogin.frame.origin
        rect.origin.y += btnLogin.frame.size.height
        rect.size.width = btnLogin.frame.width * 0.33
        btnReg = UIButton(frame: rect)
        
        rect.origin = btnReg.frame.origin
        rect.origin.x += btnLogin.frame.width / 2
        rect.size = btnReg.frame.size
        rect.size.width = btnLogin.frame.width / 2
        btnNeedHelp = UIButton(frame: rect)
        
        rect.origin = textPwd.frame.origin
        rect.origin.x += textPwd.frame.size.width + 5
        rect.size.width = 50
        switchPwd = UISwitch(frame: rect)
        
        imageView = UIImageView()
        imageView.frame = self.view.frame
        imageView.image = UIImage(named: "icon3")
        
        self.view.addSubview(imageView)
        self.view.addSubview(labelUsername)
        self.view.addSubview(labelPwd)
        self.view.addSubview(textUsername)
        self.view.addSubview(textPwd)
        self.view.addSubview(btnLogin)
        self.view.addSubview(btnReg)
        self.view.addSubview(btnNeedHelp)
        self.view.addSubview(switchPwd)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1)
        
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
        textPwd.returnKeyType = .Done
        textPwd.delegate = self
        textPwd.secureTextEntry = true
        
        btnLogin.setTitle("Login", forState: .Normal)
        btnLogin.backgroundColor = UIColor.darkGrayColor()
        btnLogin.addTarget(self, action: Selector("login"), forControlEvents: UIControlEvents.TouchUpInside)
        btnLogin.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnLogin.enabled = false

        
        btnReg.setTitle("Sign Up", forState: .Normal)
        btnReg.titleLabel?.font = UIFont.systemFontOfSize(12)
        btnReg.titleLabel?.textAlignment = .Left
        btnReg.frame.origin.x -= 10
        btnReg.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btnReg.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
        btnReg.backgroundColor = nil
        btnReg.addTarget(self, action: Selector("register:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        btnNeedHelp.setTitle("Need help?", forState: .Normal)
        btnNeedHelp.titleLabel?.font = UIFont.systemFontOfSize(12)
        btnNeedHelp.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btnNeedHelp.frame.origin.x += 17
        
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
//        let alertView = UIAlertView(title: "Warn", message: "功能暂时无", delegate: self, cancelButtonTitle: "确定")
//        alertView.show()
//        let alertView = UIAlertController(title: "Warn", message: "功能暂时无", preferredStyle: UIAlertControllerStyle.Alert)
//        alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
//        self.presentViewController(alertView, animated: true, completion: nil)
        
        let segView = SegViewController()
        self.presentViewController(segView, animated: true, completion: nil)
    }
    
    func register(sender: UIButton) {
        print("it's register")
        
        let reg = RegisterViewController()
        reg.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(reg, animated: true, completion: nil)
    }
    
    func switch_pwd_appear() {
        if switchPwd.on {
            textPwd.secureTextEntry = false
        } else {
            textPwd.secureTextEntry = true
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
