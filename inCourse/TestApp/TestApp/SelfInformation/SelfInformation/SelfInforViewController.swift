//
//  SelfInforViewController.swift
//  SelfInformation
//
//  Created by Gatsby on 15/12/12.
//  Copyright © 2015年 Gatsby. All rights reserved.
//

import UIKit

class SelfInforViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView:UITableView!
    var Dic = Dictionary<Int, [String]>()
    let me = UserItem()
    var headphoto:UIImage!
    var flag = 0//MARK: 用户头像更换测试,以后删除
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationPrepare()
        tableviewPrepare()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func navigationPrepare(){
        self.title = "Me"
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor =
            UIColor(red: 0/255, green: 160/255, blue: 255/255, alpha: 1)//导航栏背景颜色
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor()]//文字颜色
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()//按钮颜色
        let item = UIBarButtonItem(title: "", style: .Plain, target: self, action: nil)//导航栏返回的按键名
        self.navigationItem.backBarButtonItem = item;
        
        print("navigation loaded")
        
    }
    
    func tableviewPrepare(){
    
        self.tableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height),
            style: UITableViewStyle.Grouped)//创建表视图
        self.tableView.dataSource=self//数据源
        self.tableView.delegate=self//委托
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "aCell")
        
        self.view.addSubview(self.tableView)
        
        //json数据在此操作
        saveJsonInMe()
       // print(Dic)
        print("tableview loaded")
    }
    
    //MARK:json数据的操作
    func saveJsonInMe(){
        let jsonFilePath = NSBundle.mainBundle().pathForResource("test", ofType: "json")//当前json数据
        print(jsonFilePath)//显示json路径
        let data = NSData(contentsOfFile: jsonFilePath!)//实例化NSData对象
        
        let json = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary//反序列化
        let selfDataSource = json["1"] as! NSArray
        
        for current in selfDataSource {
            self.me.username = current["u_Name"] as? String
            self.me.userpic = current["userpic"] as? String
            self.me.userfavorite = current["userfavorite"] as? String
            self.me.userhistroy = current["userhistroy"] as? String
            self.me.userrank = current["userrank"] as? String
            self.me.userphone = current["u_PhoneNo"] as? String
            self.me.useremail = current["u_Email"] as? String
            self.me.learnStat = current["learnStat"] as? String
            self.me.fromSchool = current["fromSchool"] as? String
        }
        self.Dic = [
            0:["\(self.me.username!)"],
            1:["习题收藏","练习历史","排行榜"],
            2:["设置"]
        ]

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.Dic.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Dic[section]!.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中状态
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let secno = indexPath.section
        if secno == 0{//在分区1中选中
            let insidemyinfo = InsideMyInfo()
            ////// 传值过去 /////
            insidemyinfo.userpic = self.me.userpic!
            insidemyinfo.username = self.me.username!
            insidemyinfo.userphone = self.me.userphone!
            insidemyinfo.useremail = self.me.useremail!
            self.navigationController?.pushViewController(insidemyinfo, animated: true)
        }
        else if secno == 1{//在分区2中选中 //待添加功能
            if indexPath.row == 0{//选中第一行
                 let collection = CollectionView()
                 self.navigationController?.pushViewController(collection, animated: true)
            }
            else if indexPath.row == 1{//选中第2行
//                let favorite = MyfavoriteTableViewController()//使用同一对象不同显示
//                favorite.flag = 1//改变其显示
//                self.navigationController?.pushViewController(favorite, animated: true)
            }
            else {print("index 3")}//选中第3行
        }
        else {//在分区2中选中 //待添加功能
            //print("setting")
            let setView = SettingView()
            setView.learnStat = self.me.learnStat!
            setView.fromSchool = self.me.fromSchool!
            self.navigationController?.pushViewController(setView, animated: true)
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        let secno = indexPath.section
        if secno == 0{//第一个分区的行高点点
            return 150
        }else{//其它行高普通
            return 50
        }
    }//end of heightForRowAtIndexPath
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 1
    }//表头高度
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let secno = indexPath.section  //分区号
        var data = self.Dic[secno]!
        
        if secno == 0 {  //第一分区配置
            let cell = tableView.dequeueReusableCellWithIdentifier("aCell",forIndexPath: indexPath)
            cell.textLabel!.text = data[indexPath.row]
            if flag == 0{
                cell.imageView!.image = UIImage(named: "\(self.me.userpic!)")
            }else{
                cell.imageView!.image = headphoto//MARK: 当更改头像后使用
            }
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell
        }else if secno == 1{//第二分区配置
            let cell = tableView.dequeueReusableCellWithIdentifier("aCell",forIndexPath: indexPath)
            cell.textLabel!.text = data[indexPath.row]
            if(indexPath.row == 0){
                cell.imageView!.image = UIImage(named: "collection.png")
            }else if indexPath.row == 1{cell.imageView!.image = UIImage(named: "history.png")}
            else if indexPath.row == 2{cell.imageView!.image = UIImage(named: "rank.png")}
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell
        }
        else{//最后一个分区配置
            let cell = tableView.dequeueReusableCellWithIdentifier("aCell",forIndexPath: indexPath)
            cell.textLabel!.text = data[indexPath.row]
            cell.imageView!.image = UIImage(named: "config.png")
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell
        }
    }

}
