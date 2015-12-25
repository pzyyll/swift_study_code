//
//  MainTabViewController.swift
//  TestApp
//
//  Created by pzyyll on 15/12/25.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    let tabs = ["test", "messages", "me"];
    
    override func loadView() {
        super.loadView()
        
        var items = [UITabBarItem]()
        for tab in tabs {
            let tabBarItem = UITabBarItem();
            tabBarItem.image = UIImage(named: tab)
            tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            tabBarItem.title = tab;
            items.append(tabBarItem)
        }
        self.tabBar.setItems(items, animated: true)
        
        self.setViewControllers([TestSearchViewController()], animated: true)
        self.selectedIndex = 0;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
