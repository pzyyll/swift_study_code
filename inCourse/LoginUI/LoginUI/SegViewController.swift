//
//  SegViewController.swift
//  LoginUI
//
//  Created by pzyyll on 15/11/27.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class SegViewController: UIViewController, UIActionSheetDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    var textField = UITextField()
    var btnAdd = UIButton()
    var btnDelete = UIButton()
    
    var seg: UISegmentedControl!
    
    var pickerView = UIPickerView()
    var sportArray = ["篮球", "网球", "乒乓球", "什么鬼"]
    
    var btnDisplay = UIButton()
    
    var datePicker = UIDatePicker()  //日期选择器
    
    override func loadView() {
        super.loadView()
        
        var rect = CGRectMake(self.view.frame.width / 11, 50, self.view.frame.width * 6 / 11, 30)
        self.textField.frame = rect
        
        rect.origin.x += self.textField.frame.width
        rect.size.width = self.view.frame.width * 2 / 11
        btnAdd.frame = rect
        
        rect.origin.x += rect.size.width
        btnDelete.frame = rect
        
        let items = ["提醒", "操作表", "选择器", "日期选择器"]
        seg = UISegmentedControl(items: items)
        
        rect.origin.x = 10
        rect.origin.y += 50
        
        rect.size.width = self.view.frame.width - 20
        seg.frame = rect
        
        rect = CGRectMake(20, 150, 300, 300)
        self.pickerView.frame = rect
        
        rect = CGRectMake(self.view.frame.width / 2, self.view.frame.height * 4/5, 120, 30)
        btnDisplay.frame = rect
        
        self.view.addSubview(self.pickerView)
        self.view.addSubview(self.textField)
        self.view.addSubview(self.btnAdd)
        self.view.addSubview(self.btnDelete)
        self.view.addSubview(self.seg)
        self.view.addSubview(self.btnDisplay)
        
        self.datePicker.frame = pickerView.frame
        self.view.addSubview(self.datePicker)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.textField.borderStyle = .RoundedRect
        self.textField.placeholder = "Please input the segment name"
        
        self.btnAdd.enabled = true
        self.btnDelete.enabled = true
        self.btnAdd.setTitle("Add", forState: .Normal)
        self.btnDelete.setTitle("Delet", forState: .Normal)
        self.btnAdd.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.btnDelete.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.seg.tintColor = UIColor.redColor()
        
        self.btnAdd.addTarget(self, action: Selector("btn_add"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btnDelete.addTarget(self, action: Selector("btn_delete"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.seg.addTarget(self, action: Selector("segChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        self.btnDisplay.setTitle("Display select", forState: .Normal)
        self.btnDisplay.backgroundColor = UIColor.darkGrayColor()
        self.btnDisplay.addTarget(self, action: Selector("btn_display:"), forControlEvents: UIControlEvents.TouchUpInside)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func btn_add() {
        let num = self.seg.numberOfSegments  //获取段数
        
        let inputTitle = self.textField.text!
        if !(inputTitle.isEmpty) {
            self.seg.insertSegmentWithTitle(inputTitle, atIndex: num, animated: true)
            self.textField.text = ""
        }
    }
    
    func btn_delete() {
        let num = self.seg.numberOfSegments
        if num > 4 {
            self.seg.removeSegmentAtIndex(num - 1, animated: true)
        }
    }
    
    func segChanged(sender: UISegmentedControl) {
        switch self.seg.selectedSegmentIndex {
        case 0:
            let alertView = UIAlertController(title: "Warn", message: "Hello!", preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alertView, animated: true, completion: nil)
        case 1:
            var sheet = UIActionSheet(title: "提示", delegate: self, cancelButtonTitle: "OK", destructiveButtonTitle: "Select", otherButtonTitles: "Man", "Lady")
            sheet.delegate = self
            sheet.showInView(self.view)
        case 2:
            self.pickerView.dataSource = self
            self.pickerView.delegate = self
            self.pickerView.showsSelectionIndicator = true
            //设置显示默认值
            self.pickerView.selectRow(1, inComponent: 0, animated: true)
            self.view.bringSubviewToFront(self.pickerView)
        case 3:
            self.view.bringSubviewToFront(self.datePicker)
            btnDisplay.setTitle("Display Time", forState: .Normal)
        default:
            break
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        print(actionSheet.buttonTitleAtIndex(buttonIndex))
    }
    
    //设置选择器各项的内容，属于UIPickerViewDelegate协议
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sportArray[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sportArray.count
    }
    
    
    func btn_display(sender: UIButton) {
        
        switch sender.titleLabel!.text! {
        case "Display Time":
                var date = self.datePicker.date
                var dformater = NSDateFormatter()
            dformater.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
            var dateStr = dformater.stringFromDate(date)
                
                let alertView = UIAlertController(title: "Warn", message: "您选择的日期是", preferredStyle: UIAlertControllerStyle.Alert)
                alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alertView, animated: true, completion: nil)
        case "Display select":
            let idx = self.pickerView.selectedRowInComponent(0)
            
            let alertView = UIAlertController(title: "Warn", message: String(sportArray[idx]), preferredStyle: UIAlertControllerStyle.Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alertView, animated: true, completion: nil)
        default:
            break
        
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
