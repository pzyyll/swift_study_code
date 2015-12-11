//
//  UITableViewController.swift
//  UITableViewV2
//
//  Created by CAIZHILI on 15/12/8.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import UIKit

enum UIControlType {
    case Basic
    case Advanced
}

class UITableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate, UISearchBarDelegate {
    
    var toolBar: UIToolbar?
    var tableView: UITableView?
    var ctrlnames: [String]?
    var allNames: [Int: [String]]?
    var adHeaders: [String]?
    var ctype: UIControlType!
    let identify = "aCell"
    
    var serchBar : UISearchBar?
    var serchConten = [Int: [String]]()
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        var rect = CGRectMake(0, 20, self.view.frame.width, 30)
        self.toolBar  = UIToolbar(frame: rect)
        let btnPlain = UIBarButtonItem(
            title: "Plain",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("plainClicked:")
        )
        let btnSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let btnGroup = UIBarButtonItem(
            title: "Group",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("groupClicked:")
        )
        self.toolBar?.setItems([btnPlain, btnSpace, btnGroup], animated: true)
        
        self.view.addSubview(self.toolBar!)
    
        rect.origin.y += 30
        self.serchBar = UISearchBar(frame: rect)
        self.view.addSubview(self.serchBar!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ctrlnames = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Controls", ofType: "plist")!) as? [String]
        print(self.ctrlnames)
        
        self.allNames = [
            0: [String](self.ctrlnames!),
            1: [String]([
                "UIDatePiker",
                "UIWebView",
                "UIToolbal",
                "UITableView"
                ])
        ]
        self.serchConten = self.allNames!
        self.adHeaders = [
            "Common UIKit Controls",
            "High UIKit Controls"
        ]
        
        self.serchBar?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func plainClicked(sender: UIBarButtonItem) {
        self.ctype = UIControlType.Basic
        
        let rect = CGRectMake(0, 100, self.view.frame.width, self.view.frame.height - 100)
        
        self.tableView = UITableView(frame: rect, style: UITableViewStyle.Plain)
        
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: identify)
        self.view.addSubview(self.tableView!)
        
        let headerLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width,30))
        headerLabel.backgroundColor = UIColor.darkGrayColor()
        headerLabel.textColor = UIColor.blackColor()
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        headerLabel.text = "Commonly Social"
        headerLabel.font = UIFont.italicSystemFontOfSize(20)
        self.tableView!.tableHeaderView = headerLabel
        
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("tableViewCellLongPressed:"))
        longPress.delegate = self
        longPress.minimumPressDuration = 1
        self.tableView!.addGestureRecognizer(longPress)
    }
    
    func groupClicked(sender: UIBarButtonItem) {
        self.ctype = UIControlType.Advanced
        
        let rect = CGRectMake(0, 100, self.view.frame.width, self.view.frame.height - 100);
        self.tableView = UITableView(frame: rect, style: .Grouped)
        
        self.tableView!.delegate = self
        self.tableView?.dataSource = self
        
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: identify)
        self.view.addSubview(self.tableView!)
        
        let headerLabel = UILabel(frame: CGRectMake(0,0,self.view.frame.width,30))
        headerLabel.backgroundColor = UIColor.darkGrayColor()
        headerLabel.textColor = UIColor.blackColor()
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        headerLabel.text = "H Social"
        headerLabel.font = UIFont.italicSystemFontOfSize(20)
        self.tableView!.tableHeaderView = headerLabel
        
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("tableViewCellLongPressed:"))
        longPress.delegate = self
        longPress.minimumPressDuration = 1
        self.tableView!.addGestureRecognizer(longPress)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.ctype == .Basic ? 1 : 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.serchConten[section]!.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let data = self.serchConten[indexPath.section]
        
        if (indexPath.section == 0) {
            let cell = self.tableView!.dequeueReusableCellWithIdentifier(self.identify, forIndexPath: indexPath)
            cell.accessoryType = .DisclosureIndicator
            cell.textLabel!.text = data![indexPath.row]
            let image = UIImage(named: "heart");
            cell.imageView!.image = image;
            
            return cell;
        } else {
            let adcell = UITableViewCell(style: .Subtitle, reuseIdentifier: identify)
            adcell.textLabel!.text = data![indexPath.row]
            adcell.detailTextLabel?.text = "this is \(data![indexPath.row])"
            return adcell
        }
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.adHeaders![section]
    }
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let data = self.serchConten[section]
        return "Alls \(data!.count)"
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true);
        let itemString = self.serchConten[indexPath.section]![indexPath.row]
        
        let alterView = UIAlertController(title: "Yes",
            message: "it's \(itemString)",
            preferredStyle: .Alert);
        let btnOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil);
        alterView.addAction(btnOk);
        self.presentViewController(alterView, animated: true, completion: nil)
    }
    
    //long press
    func tableViewCellLongPressed(sender: UILongPressGestureRecognizer) {
        if (sender.state == UIGestureRecognizerState.Began) {
            print("")
            print("UIGesture Began")
        }
        if (sender.state == UIGestureRecognizerState.Changed) {
            print("")
            print("UIGesture state Changed")
        }
        
        if (sender.state == UIGestureRecognizerState.Ended) {
            print("")
            print("UIGesture state ended")
            
            if(self.tableView!.editing == false) {
                self.tableView!.setEditing(true, animated: true)
            } else {
                self.tableView?.setEditing(false, animated: true)
            }
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if (indexPath.section == 1) {
            return UITableViewCellEditingStyle.Insert
        }
        return UITableViewCellEditingStyle.Delete
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        let data = self.serchConten[indexPath.section]!
        
        return "确定删除\(data[indexPath.row])?"
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == .Delete) {
            self.serchConten[indexPath.section]!.removeAtIndex(indexPath.row)
            self.tableView!.reloadData()
            self.tableView!.setEditing(true, animated: true)
        } else if (editingStyle == .Insert) {
            self.serchConten[indexPath.section]!.insert("New cell", atIndex: indexPath.row + 1)
            self.tableView!.reloadData()
        }
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText == "" {
            self.serchConten = self.allNames!
        } else {
            self.serchConten.removeAll()
            for (key, val) in self.allNames! {
                for ctrl in val {
                    if ctrl.hasPrefix(searchText) {
                        print(ctrl)
                        if serchConten[key] == nil {
                            serchConten[key] = [ctrl]
                        } else {
                            serchConten[key]?.append(ctrl)
                        }
                    }
                }
            }
        }
        
        self.tableView!.reloadData()
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.serchBar?.resignFirstResponder()
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
