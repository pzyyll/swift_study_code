//
//  ViewController.swift
//  TestIOS
//
//  Created by pzyyll on 15/9/18.
//  Copyright (c) 2015年 pzyyll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let textMail = UITextField(frame: CGRectMake(126, 460, 200, 30))
    let textUserName = UITextField(frame: CGRectMake(126, 500, 200, 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        textMail.borderStyle = UITextBorderStyle.RoundedRect
        textMail.placeholder = "email"
        self.view.addSubview(textMail)
        
        textUserName.borderStyle = UITextBorderStyle.RoundedRect
        textUserName.placeholder = "username"
        self.view.addSubview(textUserName)
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
        
        if userName.text!.isEmpty {
            displayUP.text! = "请输入密码！！"
            return
        }

        let user = (name: "admin", pwd: "123")
        if userName.text! == user.name &&
            pwd.text! == user.pwd {
                displayUP.text = "right"
        } else {
            displayUP.text = "error"
        }
        
        //print("name \(userName!) pwd \(pwd)")
    }
    
    
    func verifyIsEmail(email: String) -> Bool {
        var cntAnd = 0, cntDou = 0
        for c in email.characters {
            switch c {
                case "@":
                    ++cntAnd;
                case ".":
                    ++cntDou;
                default:
                    break
            }
        }
        if cntAnd != 0 && cntDou != 0 {
            return true
        }
        return false
    }
    
    func pwdIsLegal(pwd: String) -> Bool {
        if pwd.characters.count <= 6 ||
            pwd.characters.count > 16 {
                return false
        }
        return true
    }
    
    func verifyUsernameIsLegal(username: String) -> Bool {
        var upChar = false, lowChar = false, numChar = false
        
        for c in username.characters {
            switch c {
                case "A"..."Z":
                    upChar = true;
                case "a"..."z":
                    lowChar = true;
                case "0"..."9":
                    numChar = true;
            default:
                break
            }
        }
        if upChar && lowChar && numChar {
            return true
        }
        return false
    }
    
    @IBAction func OnTouchBnReg(sender: UIButton) {
//        if !verifyIsEmail(textMail.text!) {
//            displayUP.text = "邮箱非法！！"
//            return
//        }
//        if !pwdIsLegal(pwd.text!) {
//            displayUP.text = "密码长度在6~16之间哦"
//            return
//        }
//        
//        displayUP.text = "注册成功"
        
        //用户名注册
        if textUserName.text!.isEmpty {
            displayUP.text = "用户名没有填写"
            return
        }
        if !verifyUsernameIsLegal(textUserName.text!) {
            displayUP.text = "用户名要包含大写字母和小写字母，及数字"
            return
        }
        if pwd.text!.isEmpty {
            displayUP.text = "密码没有填"
            return
        }
        if !pwdIsLegal(pwd.text!) {
            displayUP.text = "密码长度在6~16之间哦"
            return
        }
        displayUP.text = "注册成功"
        
    }
    
}


