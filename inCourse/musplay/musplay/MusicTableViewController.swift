//
//  MusicTableViewController.swift
//  musplay
//
//  Created by pzyyll on 15/12/11.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit
import AVFoundation

class MusicTableViewController: UITableViewController {

    var imgView = UIImageView()
    var slider: UISlider? //slider
    var btnPause: UIButton?
    var btnStop: UIButton? //stop
    
    var sonLibary = [Son]()
    var songBundle = [String]()
    var player: AVAudioPlayer!
    var timeSlider: NSTimer!    //time trigger
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnPause = UIButton()
        self.btnStop = UIButton()
    
        self.navigationController?.navigationBarHidden = true
        var bgView = UIView(frame: CGRectMake(0, 20, self.view.frame.width, self.view.frame.height / 2))
        self.imgView.frame = bgView.frame
        self.imgView.frame.size.height -= 50
        bgView.addSubview(self.imgView)
        
        var tool = UIView(frame: CGRectMake(0, imgView.frame.height, self.view.frame.width, 50))
        tool.backgroundColor = UIColor.blackColor()
        bgView.addSubview(tool)
        
        
        self.slider = UISlider(frame: CGRectMake(10, 0, tool.frame.width * 2/3, 50))
        self.slider?.thumbTintColor = UIColor(red: 0.2, green: 0.8, blue: 0.5, alpha: 1.0)
        self.slider?.tintColor = UIColor(red: 0.2, green: 0.8, blue: 0.5, alpha: 1.0)
        
        self.btnPause?.frame = CGRectMake(self.slider!.frame.width + 20, 10, tool.frame.height * 2/3, tool.frame.height * 2/3)
        self.btnPause?.setBackgroundImage(UIImage(named: "pause.png"), forState: .Normal)
        self.btnPause?.setTitle("暂停", forState: .Normal)
        self.btnPause?.setTitleColor(UIColor.clearColor(), forState: .Normal)
        
        self.btnStop?.frame = CGRectMake(tool.frame.width - tool.frame.height, 10, tool.frame.height * 2/3, tool.frame.height * 2/3)
        
        self.btnStop?.setBackgroundImage(UIImage(named: "stop.png"), forState: .Normal)
        
        tool.addSubview(self.slider!)
        tool.addSubview(self.btnStop!)
        tool.addSubview(self.btnPause!)
        
        self.btnPause?.enabled = false
        self.btnPause?.enabled = false
        
        //butt
        self.btnPause?.addTarget(self, action: Selector("pause"), forControlEvents: UIControlEvents.TouchUpInside)
        self.btnStop?.addTarget(self, action: Selector("stop"), forControlEvents: UIControlEvents.TouchUpInside)
        self.slider?.addTarget(self, action: Selector("progressCtr"), forControlEvents: .ValueChanged)
        
        self.tableView.tableHeaderView = bgView
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "bg.jpg"))
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        
        //4.获取歌曲路径
        getMp3Paths()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
        
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
        return sonLibary.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "reuseIdentifier")
        // Configure the cell...
        cell.textLabel?.text = sonLibary[indexPath.row].title
        cell.detailTextLabel?.text = sonLibary[indexPath.row].artist
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.imgView.image = self.sonLibary[indexPath.row].img
        
        //1.create player
        let mp3Url = NSURL(fileURLWithPath: self.songBundle[indexPath.row])
        do {
            self.player = try AVAudioPlayer(contentsOfURL: mp3Url)
            
            //播放
            self.player.prepareToPlay()
            self.player.numberOfLoops = -1  //set loop times, default all the time loop
            
            player.play()
            self.btnPause?.enabled = true
            self.btnPause?.enabled = true
            
            //every second auto call
            self.timeSlider = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timeUp"), userInfo: nil, repeats: true)
        } catch {
            print("shit")
        }
        
    }
    
    func timeUp() {
        self.slider?.value = Float(self.player.currentTime / self.player.duration)
    }
    
    func getMp3Paths() {
        //获取MP3路径
        let bundle = NSBundle.mainBundle().bundlePath
        self.songBundle = NSBundle.pathsForResourcesOfType("mp3", inDirectory: bundle)
        
        for mp3Path in songBundle {
            let fileManager = NSFileManager()   //
            if fileManager.fileExistsAtPath(mp3Path) {
                let mp3url = NSURL(fileURLWithPath: mp3Path)
                print(mp3url)
                print(sonLibary.count)
                //2.获取信息
                let mp3Asset = AVURLAsset(URL: mp3url, options: nil)
                let song = Son()
                for format in mp3Asset.availableMetadataFormats {
                    for metadataItem in mp3Asset.metadataForFormat(format) {
                        if metadataItem.commonKey != nil {
                            if metadataItem.commonKey == "artwork" {
                                //picture
                                let data = metadataItem.value as! NSData
                                //self.imgView.image = UIImage(data: data)
                                song.img = UIImage(data: data)
                            } else if metadataItem.commonKey == "title" {
                                //title
                                let mp3Titile = metadataItem.value as! String
                                song.title = mp3Titile
                                
                            } else if metadataItem.commonKey == "artist" {
                                //artist
                                song.artist = metadataItem.value as? String
                            }
                        }
                    }
                }
                
                self.sonLibary.append(song)
            }
        }
    }
    
    func pause() {
        if btnPause?.titleLabel?.text == "播放" {
            btnPause?.setTitle("暂停", forState: .Normal)
           // btnPause?.setTitleColor(UIColor.clearColor(), forState: .Normal)
            btnPause?.setBackgroundImage(UIImage(named: "pause.png"), forState: .Normal)
            player.play()
        } else {
            btnPause?.setTitle("播放", forState: .Normal)
            //btnPause?.setTitleColor(UIColor.clearColor(), forState: .Normal)
            btnPause?.setBackgroundImage(UIImage(named: "play.png"), forState: .Normal)
            player.pause()
        }
        
    }
    
    func stop() {
        self.player.stop()
        self.player.currentTime = 0
        self.slider?.value = 0
    }
    
    func progressCtr() {
        self.player.currentTime = self.player.duration * NSTimeInterval(slider!.value)
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
