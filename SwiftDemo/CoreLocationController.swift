//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 陈志望 on 15/7/24.
//  Copyright (c) 2015年 陈志望. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

//地理位置信息        
class CoreLocationController: UIViewController,CLLocationManagerDelegate {
    
    //ios 自己的地图控件
    @IBOutlet weak var mapView: MKMapView!
    
    //设置地图位置
    func centerMapOnLocation(var location:CLLocation) {
       
        let regionRadius: CLLocationDistance = 1000
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
        //添加定位标记
        var annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotation.title = "椒江"
        annotation.subtitle = "测试信息"
        
        mapView.addAnnotation(annotation)
    }
    
    
    
   
    
    let locationManger=CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManger.delegate=self;
        
        self.locationManger.desiredAccuracy=kCLLocationAccuracyBest
        if(ios8()){
            locationManger.requestAlwaysAuthorization()
        }
        locationManger.startUpdatingLocation()
        
        //afnetworking()
         var location = CLLocation( latitude: 28.67, longitude: 121.44)
         centerMapOnLocation(location)
    }
    
    //测试调用afnetworking
    func afnetworking(){
        let manager = AFHTTPRequestOperationManager()
        let url="http://weidemon.sinaapp.com/"
        let params = ["a":"nothing","b":"nothing"]
        
        manager.GET(
            url,
            parameters:params,
            success: {
                (operation:AFHTTPRequestOperation!,responseObject:AnyObject!) in
                println(responseObject)
            },
            failure:{
                (operation: AFHTTPRequestOperation!,error: NSError!) in
                println(error)
        })
        
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
            
           //centerMapOnLocation(location)
            
            //停止获取地址
            self.locationManger.stopUpdatingLocation()
        }
    }
    
    //错误处理
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
        println(error)
    }
    
}
