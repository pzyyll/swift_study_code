//
//  MainViewController.swift
//  samplenote
//
//  Created by CAIZHILI on 15/12/11.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var noteLibary = [NoteItem]()
    var mainTableView: UITableView?
    let identify = "aCell"
    
    var toolbar: UIToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        self.noteLibary.append(NoteItem(title: "abc", item: "abc"))
        self.noteLibary.append(NoteItem(title: "abc", item: "abc"))
        self.noteLibary.append(NoteItem(title: "abc", item: "abc"))
        
        self.toolbar = UIToolbar(frame: CGRectMake(0, 20, self.view.frame.width, 30))
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        
        let addBtn = UIBarButtonItem(image: UIImage(named: "add"), style: UIBarButtonItemStyle.Plain, target: self, action: Selector("addNewNote"))
        
        self.toolbar?.setItems([spaceBtn, addBtn], animated: true)
        self.view.addSubview(self.toolbar!)
        
        var rect = self.view.frame
        rect.origin.y = 100
        self.mainTableView = UITableView(frame: rect, style: .Grouped)
        
        self.mainTableView?.delegate = self
        self.mainTableView?.dataSource = self
        
        self.mainTableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: identify)
        
        self.view.addSubview(mainTableView!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.noteLibary.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let data = self.noteLibary[indexPath.row]
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: self.identify)
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = data.title
        let datef = NSDateFormatter()
        datef.dateFormat = "hh:mm"
        cell.detailTextLabel?.text = datef.stringFromDate(data.date!)
        
        return cell
    }
    
    func addNewNote() {
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//    func rowsForNoteTable(tableView: TableView) -> Int {
//        return self.noteLibary.count
//    }
//    
//    func NoteTableView(tableView: TableView, dataForRow row: Int) -> NoteItem
//    {
//        return self.noteLibary[row]
//    }
    
}
