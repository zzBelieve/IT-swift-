//
//  MainViewController.swift
//  IT江湖.swift
//
//  Created by ZZBelieve on 15/8/26.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    //标题
    
    var navTitleLabel = UILabel()
    
    
    //页码
    var PAGE_NUM = 0
    
    //一页显示的数量
    
    var SHOW_NUM = 20
    
    //cell标识符
    
    let identifier = "cell"
    
    //文章列表数据
    
    var dataSource: [Article] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let iOS7:Bool = Define.IfiOS7()
        
        let width:CGFloat = Define.ScreenWidth()
        
        let height:CGFloat = Define.ScreenHeight()
        
        //Nav
        
        let labelW: CGFloat = 200
        let labelH: CGFloat = 44
        
        if iOS7==true {
        
            navTitleLabel.frame = CGRectMake((width-200)/2, 20.0, labelW, labelH)
        
        }else{
        
           navTitleLabel.frame = CGRectMake((width-200)/2, 0, labelW, labelH)
        
        }
        
        navTitleLabel.text = "IT江湖"
        navTitleLabel.textColor = UIColor.blackColor()
        navTitleLabel.backgroundColor = UIColor.clearColor()
        navTitleLabel.textAlignment = NSTextAlignment.Center
        
        self.navigationItem.titleView = navTitleLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
