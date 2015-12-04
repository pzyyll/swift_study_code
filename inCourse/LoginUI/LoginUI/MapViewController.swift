//
//  MapViewController.swift
//  LoginUI
//
//  Created by pzyyll on 15/12/4.
//  Copyright © 2015年 pzyyll. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UIScrollViewDelegate {
    
    let mapView = UIImageView(image: UIImage(named: "dalianMap.jpg"))
    
    var scrollView = UIScrollView()
    
    override func loadView() {
        super.loadView()
        
        self.scrollView.addSubview(mapView)
        self.view.addSubview(scrollView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        self.view.backgroundColor = UIColor.whiteColor()
        
        //delegate
        self.scrollView.delegate = self
        self.scrollView.frame = self.view.frame
        //实际大小
        self.scrollView.contentSize = self.mapView.frame.size
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        
        self.scrollView.pagingEnabled = true //是否允许滚动， must set
        //计算横纵的缩放比例
        let ratioX = self.scrollView.frame.width / self.mapView.frame.width
        let ratioY = self.scrollView.frame.height / self.mapView.frame.height
        let minScale = min(ratioX, ratioY)
       
        
        //限制缩放比例
        self.scrollView.minimumZoomScale = minScale
        self.scrollView.maximumZoomScale = 1.0
        //self.scrollView.zoomScale = minScale //初始图片全部显示
        self.scrollView.setZoomScale(minScale, animated: true)
        
        //放置的位置
        conterScrollViewContens()
        
        //点击手势，实现点击放大
        let doubleTapRecongnizer = UITapGestureRecognizer(target: self, action: Selector("scrollViewDoubleTapped:"))
        doubleTapRecongnizer.numberOfTapsRequired = 2
        self.scrollView.addGestureRecognizer(doubleTapRecongnizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func conterScrollViewContens() {
        let boundSize = self.scrollView.bounds.size
        var contentFrame = self.mapView.frame
        //水平居中位置
        if contentFrame.size.width < boundSize.width {
            contentFrame.origin.x = (boundSize.width - contentFrame.size.width) / 2.0
        } else {
            contentFrame.origin.x = 0.0
        }
        //垂直居中位置
        if contentFrame.size.height < boundSize.height {
            contentFrame.origin.y = (boundSize.height - contentFrame.size.height) / 2.0
        } else {
            contentFrame.origin.y = 0.0
        }
        
        self.mapView.frame = contentFrame
    }

    //返回待缩放的视图
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.mapView
    }
    
    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
        //获取双击的位置
        let pointInView = recognizer.locationInView(self.mapView)
        
        //计算新的缩放比例， 并且不能大于原最大缩放比例
        var newZoomScale = self.scrollView.zoomScale * 1.5
        newZoomScale = min(newZoomScale, self.scrollView.maximumZoomScale)
        
        let scrollViewSize = self.scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w / 2.0)
        let y = pointInView.y - (h / 2.0)
        let rectToZoom = CGRectMake(x, y, w, h)
        
        //进行缩放，使用动画效果
        self.scrollView.zoomToRect(rectToZoom, animated: true)
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
