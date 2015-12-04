//
//  TableViewController.swift
//  TableView
//
//  Created by pzyyll on 15/12/4.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    private let identify: String = "aCell"
    var ctrls = ["UILable","UIButton","UITextField","UISwitch",
                "UIImageView","UIAlertView","UIActionSheet", "UISegmentedControl", "UIScrollView","UIGetureRecognizer","UIPickerView","UIDatePicker", "UIPageControl","UISlider","UIProgressView"]//基本控件数组
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.初始化一个表视图对象
        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        //2.设置数据源和委托
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //3.创建一个重用单元格，注册
        self.tableView.registerClass(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: "aCell")
        self.view.addSubview(self.tableView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //1.返回分区行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrls.count;
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
        //配置单元格
        cell.textLabel!.text = self.ctrls[indexPath.row]    //主标题
        //cell.imageView!.image = //设置图标
        //cell.detailTextLabel!.text = //副标题
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let itemStr = self.ctrls[indexPath.row]
        
        //加个处理
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
