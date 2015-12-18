//
//  ViewController.swift
//  Json
//
//  Created by pzyyll on 15/12/11.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let jsonFilePath = NSBundle.mainBundle().pathForResource("personlist", ofType: "geojson")
        print(jsonFilePath)
        
        let data = NSData(contentsOfFile: jsonFilePath!)
        
        //反序列化
        //var error: NSError?
        do {
        let jsonObj = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
            as! NSMutableArray
            
            //获取对象中的值并打印到控制台
            for person in jsonObj {
                let name = person["Name"] //as! String
                print(name!)
                
                let id = person["id"] as! Int
                print(id)
                
                let hobby = person["HobbyList"] as! [String]
                print(hobby)
            }
            
        } catch {
            print("shit")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

