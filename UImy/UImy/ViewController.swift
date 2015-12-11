//
//  ViewController.swift
//  UImy
//
//  Created by CAIZHILI on 15/11/20.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var view1: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let manager = NSFileManager.defaultManager()
        
        let urlForDocument = manager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
        print(urlForDocument)
        print(urlForDocument.count)
        let url: NSURL = urlForDocument[0]
        let str = "Hello"
        let newurl = url.URLByDeletingLastPathComponent!
        print(newurl.absoluteString)
        
        //manager.createFileAtPath(url.absoluteString, contents: str.dataUsingEncoding(NSUTF8StringEncoding), attributes: nil)
        
        do {
            let contentsOfPath = try manager.contentsOfDirectoryAtPath(newurl.path!)
            print(contentsOfPath)
        } catch {
            print("error")
        }

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

