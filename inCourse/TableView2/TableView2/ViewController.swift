//
//  ViewController.swift
//  TableView2
//
//  Created by pzyyll on 15/12/4.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate {

    var tableView: UITableView!
    private let identify: String = "aCell"
    var ctrls = ["UILabel","UIButton","UITextField","UISwitch",
        "UIImageView","UIAlertView","UIActionSheet", "UISegmentedControl", "UIScrollView","UIGetureRecognizer","UIPickerView","UIDatePicker", "UIPageControl","UISlider","UIProgressView"]//基本控件数组
    
    var adHeaders = ["基本", "高级"]
    
    var allnames: Dictionary<Int, [String]>!
    
    override func loadView() {
        super.loadView()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.allnames = [0:self.ctrls,
            1:["UITableView","UITableViewController","UISearchBar","UINavigationController","UIWebView","UIActivityIndicatorView","UITabBarController"] ]
        //1.初始化一个表视图对象
        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        //2.设置数据源和委托
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //3.创建一个重用单元格，注册
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identify)
        self.view.addSubview(self.tableView)
        // Do any additional setup after loading the view.
        
        let longPress =  UILongPressGestureRecognizer(target:self,
            action:Selector("tableviewCellLongPressed:"))
        //代理
        longPress.delegate = self
        longPress.minimumPressDuration = 1.0
        //将长按手势添加到需要实现长按操作的视图里
        self.tableView!.addGestureRecognizer(longPress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //返回分区数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.allnames.count
    }
    //1.返回分区行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allnames[section]!.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    //2.设置单元格显示内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
        
        //配置单元格
        let secno = indexPath.section
        cell.textLabel!.text = self.allnames[secno]![indexPath.row]
        //   cell.textLabel!.text = self.ctrls[indexPath.row]
        //cell.imageView!.image = //图标
        //cell.detailTextLabel!.text = //在default 风格下，没有副标题
        return cell
    }
    
    //3.头标题
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return adHeaders[section]
    }
    //4. 脚标题
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "have \(self.allnames[section]!.count)"
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中状态
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //获取被选中的单元格内容
        let itemStr = self.ctrls[indexPath.row]
        
//        let alertview = UIAlertView()
//        alertview.title = "提示"
//        alertview.message = "你选中了[\(itemStr)]"
//        alertview.addButtonWithTitle("OK")
//        alertview.show()
        //界面跳转
        
        var detail = MyDetailViewController()
        detail.title = itemStr
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
    
    //MARK:长按方法
    func tableviewCellLongPressed(gestureRecognizer:UILongPressGestureRecognizer)
    {
        
        if (gestureRecognizer.state == UIGestureRecognizerState.Ended)
        {
            //在正常状态和编辑状态之间切换
            if(self.tableView!.editing == false)
            {
                self.tableView!.setEditing(true, animated:true)
            }
            else
            {
                self.tableView!.setEditing(false, animated:true)
                
            }
        }
    }

    //4.提交编辑，让编辑生效
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            self.allnames[indexPath.section]!.removeAtIndex(indexPath.row)
            self.tableView!.reloadData()
            self.tableView!.setEditing(true, animated: true)
        }
        else if(editingStyle == UITableViewCellEditingStyle.Insert)
        {
            self.allnames[indexPath.section]!.insert("插入一项新的", atIndex: indexPath.row)
            self.tableView!.reloadData()
        }
    }
    
    //2.编辑状态，设置编辑状态
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        if(indexPath.section == 1)
        {
            return UITableViewCellEditingStyle.Insert
        }
        return UITableViewCellEditingStyle.Delete
    }
}

