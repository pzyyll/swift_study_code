//
//  NoteItem.swift
//  samplenote
//
//  Created by CAIZHILI on 15/12/11.
//  Copyright © 2015年 CAIZHILI. All rights reserved.
//

import Foundation

class NoteItem {
    var title = ""
    var item = ""
    var date: NSDate?
    
    init (title: String, item: String) {
        self.title = title
        self.item = item
        self.date = NSDate()
    }
}