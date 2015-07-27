//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 陈志望 on 15/7/24.
//  Copyright (c) 2015年 陈志望. All rights reserved.
//

import UIKit
import CoreLocation

//地理位置信息        
class CoreLocationController: UIViewController,CLLocationManagerDelegate {
    
    let locationManger=CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManger.delegate=self;
        
        self.locationManger.desiredAccuracy=kCLLocationAccuracyBest
        if(ios8()){
            locationManger.requestAlwaysAuthorization()
        }
        locationManger.startUpdatingLocation()

    }
    
    //是否ios8
    func ios8()->Bool{
        return UIDevice.currentDevice().systemVersion.hasPrefix("8.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //取得地理位置的处理
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!){
        var location:CLLocation=locations[locations.count-1] as! CLLocation;
        
        if(location.horizontalAccuracy>0){
            println(location.coordinate.latitude)
            println(location.coordinate.longitude)
            
            //停止获取地址
            self.locationManger.stopUpdatingLocation()
        }
    }
    
    //错误处理
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        println(error)
    }
    
}
