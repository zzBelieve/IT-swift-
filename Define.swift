//
//  Define.swift
//  IT江湖.swift
//
//  Created by ZZBelieve on 15/8/26.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class Define: NSObject {
   
    
    
    // 设备系统版本
    
    class func IfiOS7()->Bool{
    
    
       let Device = UIDevice.currentDevice().systemVersion
       
        let array: NSArray = Device.componentsSeparatedByString(".")
        
        let num: AnyObject! = array[0]
        
        let Num: CInt = num.intValue
    
        
        if Num >= 7 {
        
             return true
        
        }else{
        
            return false
        }
    
    }
    
    
    //获取设备的物理高度
    
    
    class func ScreenHeight()->CGFloat{
    
        
        
       return UIScreen.mainScreen().bounds.size.height
    
    
    }
    
    
    //获取设备的物理宽度
    
    
    class func ScreenWidth()->CGFloat{
    
       return UIScreen.mainScreen().bounds.size.width
    
    }
}
