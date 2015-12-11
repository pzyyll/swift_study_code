//
//  TableView.swift
//  samplenote
//
//  Created by CAIZHILI on 15/12/11.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

//import Cocoa
import UIKit

protocol NoteDataSource {
    func rowsForNoteTable(tableView: TableView) -> Int
    
    func NoteTableView(tableView: TableView, dataForRow row: Int) -> NoteItem
}

class TableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var NoteLibary: [NoteItem]
    var noteDataSource: NoteDataSource!
    
    init(frame: CGRect) {
        self.NoteLibary = [NoteItem]()
        super.init(frame: frame, style: .Grouped)
        self.backgroundColor = UIColor.clearColor()
        
        self.separatorStyle = .SingleLine
        self.delegate = self
        self.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sortDate(m1: NoteItem, m2: NoteItem) -> Bool {
        return m1.date?.timeIntervalSince1970 > m2.date?.timeIntervalSince1970
    }
    
    override func reloadData() {
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        var count = 0;
        if (self.noteDataSource != nil) {
            count = self.noteDataSource.rowsForNoteTable(self)
            if (count > 0) {
                for i in 0..<count {
                    let object = self.noteDataSource.NoteTableView(self, dataForRow: i)
                    self.NoteLibary.append(object)
                }
                NoteLibary.sortInPlace(self.sortDate)
            }
        }
        super.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section >= self.NoteLibary.count) {
            return 1
        }
        
        return self.NoteLibary.count + 1
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "aCell"
        let data = self.NoteLibary[indexPath.row]
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: cellID)
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = data.title
        
        return cell
    }

}
