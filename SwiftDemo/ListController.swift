//
//  File.swift
//  SwiftDemo
//
//  Created by 陈志望 on 15/7/25.
//  Copyright (c) 2015年 陈志望. All rights reserved.
//
import UIKit


//列表页面
class ListController:UITableViewController{
    

    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let index=indexPath.row;
        
        if (index==0){

            gotoView("PhotoController")
            
        }
        
        
        if(index==1){
        
            gotoView("CoreLocation")
        }
    }
    
    func gotoView(viewname:String){
        
        //手动控制页面跳转
        var sb = self.storyboard;
        if let vc = sb?.instantiateViewControllerWithIdentifier(viewname) as? UIViewController{
            
            //这个方法只是弹出，无法显示按钮
            //self.presentViewController(vc, animated: true, completion: nil)
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    
    }



}



