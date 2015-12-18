//
//  MainTableViewController.swift
//  news
//
//  Created by pzyyll on 15/12/11.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    let newsString = "http://c.3g.163.com/nc/article/local/5aSn6L%2Be/0-20.html"
    var newsLibary = [NewsItem]()
    var news = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        self.title = "大连新闻"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        loadDataSource()    //load news data
        
    }

    func loadDataSource() {
        //1.封装NSURL
        let url = NSURL(string: self.newsString)
        
        //2.封装NSREQUEST
        let request = NSURLRequest(URL: url!)
        //3.异步链接
        //NSURLSession
        let queue = NSOperationQueue()
//        var session = NSURLSession.sharedSession()
//        var task = session.dataTaskWithRequest(<#T##request: NSURLRequest##NSURLRequest#>) { (<#NSData?#>, <#NSURLResponse?#>, <#NSError?#>) -> Void in
//            <#code#>
//        }
        UIApplication.sharedApplication().networkActivityIndicatorVisible=true
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response, data, error) -> Void in
            if error != nil {
                print(error)
                self.refreshControl?.endRefreshing()
                UIApplication.sharedApplication().networkActivityIndicatorVisible=false
            } else if data == nil {
                    print("data is empty")
            } else {
                print("data is handler")
                //反序列化
                //var error: NSError?
                do {
                    let jsonObj = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                        as! NSMutableDictionary
                    print(jsonObj)
                    let newsDataSource = jsonObj["大连"] as! NSArray
                    let currentNewsDataSource = NSMutableArray()
                    for currentNews in newsDataSource {
                        let newsItem = NewsItem()
                        //news title
                        newsItem.newsTitle = currentNews["title"] as? String
                        //news link address
                        newsItem.newsAddr = currentNews["url"] as? String
                        //news image
                        //currentNews["imgsrc"] as! String
                        //append to array
                        currentNewsDataSource.addObject(newsItem)
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), {() -> Void in
                        self.news = currentNewsDataSource
                        self.tableView.reloadData()
                        self.refreshControl?.endRefreshing()
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    })
                    
                    //self.newsLibary = currentNewsDataSource as! [NewsItem]
                    
                    //self.news = currentNewsDataSource
                } catch {
                    print("shit")
                }
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.news.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        // Configure the cell...
        let aNew = self.news[indexPath.row] as! NewsItem
        
        cell.textLabel?.text = aNew.newsTitle
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var row = indexPath.row
        var data = self.news[row] as! NewsItem
        
        //push way
        var webView = DetailViewController()
        webView.title = data.newsTitle
        webView.url = NSURL(string: data.newsAddr!)
        self.navigationController?.pushViewController(webView, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
