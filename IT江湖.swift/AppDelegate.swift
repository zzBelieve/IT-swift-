//
//  AppDelegate.swift
//  IT江湖.swift
//
//  Created by ZZBelieve on 15/8/26.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.  55e5165067e58e3b190065dd
        
       //设置友盟社会化组件appkey
        
        UMSocialData.setAppKey("55e5165067e58e3b190065dd")
        
        //设置微信key
//        UMSocialData.setAppKey("54238dc5fd98c501b5028d70")
//        UMSocialSinaHandler.openSSOWithRedirectURL("http://sns.whalecloud.com/sina2/callback")
        
        UMSocialQQHandler.setQQWithAppId("1103695854", appKey: "Qx34CKDOmDxksgT9", url: "http://www.umeng.com/social")
        
//        [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
        
        UMSocialWechatHandler.setWXAppId("wxd930ea5d5a258f4f", appSecret: "db426a9829e4b49a0dcac7b4162da6b6", url: "http://www.umeng.com/social")
        
    
        //打开调试log开关
        UMSocialData.openLog(true)
        
        
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return UMSocialSnsService.handleOpenURL(url)
    }

    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        
        return UMSocialSnsService.handleOpenURL(url)
    }
}

