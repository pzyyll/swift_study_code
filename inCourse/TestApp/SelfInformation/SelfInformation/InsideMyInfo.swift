//
//  InsideMyInfo.swift
//  SelfInformation
//
//  Created by Gatsby on 15/12/17.
//  Copyright © 2015年 Gatsby. All rights reserved.
//

import UIKit

class InsideMyInfo: UIViewController, UITableViewDataSource, UITableViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var username = ""
    var userpic = ""
    var useremail = ""
    var userphone = ""
    var tableView : UITableView!
    var uiphoto : UIImage!
    var selected = 0;
    let Dic = [
    0:["","",""],
    1:[""],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.title = "个人信息"
        
        tableviewPrepare()
    }
    
    func tableviewPrepare(){//MARK:准备表视图
        self.tableView = UITableView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height),
            style: UITableViewStyle.Grouped)//创建表视图
        self.tableView.dataSource=self//数据源
        self.tableView.delegate=self//委托
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "aCell")
        
        self.view.addSubview(self.tableView)//加载表视图
    }
    
    /* 不用
    func loadPicture(){
        let newImage = UIImage(named: "\(self.userpic)")
        let imageView = UIImageView(image:newImage);
        imageView.frame=CGRectMake(30,100,200,200)
        self.view.addSubview(imageView)
        
        let name = UILabel()
        name.frame=CGRectMake(30, 330, 200, 50)
        name.text = self.username
        name.font = UIFont.systemFontOfSize(60)
        self.view.addSubview(name)
    }
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {//MARK:单元格分区数
        return 2//视图中有两个分区
    }
    //MARK:单元格分区内部行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Dic[section]!.count//每个分区的显示
    }
    //MARK:单元格表头高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 1//表头高度
    }
    
    //MARK:单元格选中配置
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
         let secno = indexPath.section
        if secno == 0{//在第一个分区
        if indexPath.row == 0{//选中第一行的头像
            let sheet = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
            sheet.addAction(UIAlertAction(title: "相册中选择", style: UIAlertActionStyle.Default, handler: {
                (title:UIAlertAction) -> Void in
                //print("select the \(title)")//MARK:搜索相册功能
                
                //////MARK:read photo inside
                
                //判断设置是否支持图片库
                if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
                    //初始化图片控制器
                    let picker = UIImagePickerController()
                    //设置代理
                    picker.delegate = self
                    //指定图片控制器类型
                    picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                    //设置是否允许编辑
                    picker.allowsEditing = true
                    //弹出控制器，显示界面
                    self.presentViewController(picker, animated: true, completion: {
                        () -> Void in
                    })
                }else{
                    print("读取相册错误")
                }
                
                 //////end photo inside
                
            }))
            sheet.addAction(UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default, handler: { (title:UIAlertAction) -> Void in
                //print("select the \(title)");//MARK:使用相机功能
                
                if UIImagePickerController.isSourceTypeAvailable(.Camera){
                    //创建图片控制器
                    let picker = UIImagePickerController()
                    //设置代理
                    picker.delegate = self//和相册一样相同委托
                    //设置来源
                    picker.sourceType = UIImagePickerControllerSourceType.Camera
                    //允许编辑
                    picker.allowsEditing = true
                    //打开相机
                    self.presentViewController(picker, animated: true, completion: { () -> Void in
                        
                    })
                }else{
                    let alert = UIAlertController(title: "找不到相机", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "好的", style: UIAlertActionStyle.Cancel, handler: nil))
                    self.presentViewController(alert, animated: true, completion:nil)
                    
                    print("找不到相机")
                }
                
            }))
            let btdown = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
            sheet.addAction(btdown)
            self.presentViewController(sheet, animated: true, completion: nil)
            }
            if indexPath.row == 1{//选中第2行的手机
                //MARK:待添加绑定手机功能
            }
            if indexPath.row == 2{//选中地3行的email
                //MARK:待添加绑定email功能
            }
        }//end secno 0
        else if secno == 1{//剩下的分区 //MARK:待添加注销功能
            //注销用户返回登陆界面
        }
    }//end didSelectRowAtIndexPath
    
    //MARK:单元格内部配置
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let secno = indexPath.section  //分区号
        if secno == 0{
        
            if indexPath.row == 0{
                let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Selfpic")
  
                //cell.textLabel?.text = self.username
                cell.detailTextLabel?.text = self.username//用户名在右边
                if selected == 0{
                cell.imageView!.image = UIImage(named: "\(self.userpic)")
                }
                else {
                    cell.imageView!.image = uiphoto
                    //MARK:更新头像后将打包为json通知服务器用户头像更新,待添加json功能
                }
                return cell
        }
        else if indexPath.row == 1{//当在第一个分区
                let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "BindPhone")
            
                cell.textLabel?.text = "绑定手机"
                cell.detailTextLabel?.text = self.userphone//数据来自json
                return cell
        }else{
                let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "BindEmail")
            
                cell.textLabel?.text = "绑定邮箱"
                cell.detailTextLabel?.text = self.useremail//来自json
                return cell
            }
        }//end secno 0
        else{//其它分区
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "logout")
            cell.textLabel?.text = "退出当前登陆"
            cell.textLabel?.textColor = UIColor.redColor()//设置字体颜色
            cell.textLabel?.textAlignment = NSTextAlignment.Center//字体居中显示
            return cell
        }
    }//end cellForRowAtIndexPath func
        

    //MARK:after select photo
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        print("selected\(info)")
        let image = info[UIImagePickerControllerEditedImage] as! UIImage//取得裁剪后的图片
        self.uiphoto = image
        self.selected = 1
        
        self.tableView.reloadData()
        picker.dismissViewControllerAnimated(true, completion:nil)
    }

    
}
