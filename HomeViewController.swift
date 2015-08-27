//
//  HomeViewController.swift
//  IT江湖.swift
//
//  Created by ZZBelieve on 15/8/26.
//  Copyright (c) 2015年 galaxy-link. All rights reserved.
//

import UIKit

import Alamofire
import SCLAlertView
import SwiftyJSON

class HomeViewController: MainViewController,UITableViewDelegate,UITableViewDataSource {

    
    //api
    var url = GET_ARTICLE
    
    //数据
    var dataArray:[Article] = []
    
    //tableView
    
    var zzTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    
        
        self.navTitleLabel.text = "首页"
        
        createTableView()
        
        //这里我们需要调用OC的第三方(MJRefresh)...首先New file ---- 创建一个.h文件(Bridging-Header.h.  **注意Target第一个要勾选***)--拖入MJRefresh---然后设置项目的Build Settings－－Swift Compiler－－Objective-C Bridging Header内容为IT江湖.swift/Bridging-Header.h，这个与Bridging-Header.h位置有关，-----在Bridging-Header.h中写入#import "MJRefresh.h"---完成~~~~
        
        self.zzTableView.addLegendHeaderWithRefreshingBlock { () -> Void in
            self.loadNewData()
            
        }
        
        self.zzTableView.legendHeader.beginRefreshing()
        
        self.zzTableView.addLegendFooterWithRefreshingBlock { () -> Void in
            
            self.loadMoreData()
            
        }
        
        self.zzTableView.footer.hidden = true
    }

    func loadNewData(){
    
        //菊花打开
       UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        self.PAGE_NUM = 0
        
        loadData(self.PAGE_NUM, size: SHOW_NUM, from: "Header")
    
    
    
    }
    
    func loadMoreData(){
        
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        // 1.添加数据
        self.PAGE_NUM += 1
        
        loadData(self.PAGE_NUM, size: SHOW_NUM, from:"footer")
        
        
        
    }
    
    func loadData(offset:Int, size:Int, from:String){
    
        
        
        var articleUrl = url + "\(offset)/\(size)"
        
        //请求数据
        //http://m.itjh.com.cn:8080/mitjh/ArticleServer/queryArticleListByNew/0/20
        
        Alamofire.request(.GET, articleUrl).responseJSON { (_, response, JSON_DATA, error) -> Void in
        
        
            if JSON_DATA == nil {
            
            
                  SCLAlertView().showWarning("军哥提醒您", subTitle: "网络有点小卡?你是在山沟沟嘛?", closeButtonTitle: "去探探路")
            
        
                  UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                return
            
            }else {
            
            
             
                if self.PAGE_NUM == 0 {
                
                    if !self.dataArray.isEmpty{
                    
                        self.dataArray.removeAll(keepCapacity: false)
                    
                    }
                
                }
                
                
                let data = JSON(JSON_DATA!)
                let articlesArray = data["content"].arrayValue
            
                
                println("")
                
                if articlesArray.count > 0 {
                
                
                    for dic in articlesArray{
                    
                       let article = Article()
                        
                        article.aid = dic["aid"].int!
                        
                        article.title = dic["title"].string!
                        
                        article.date = dic["date"].string!
                        
                        article.img = dic["img"].string!
                        
                        article.author_id = dic["author_id"].int!
                        
                        article.author = dic["author"].string!
                        
                        
                        //追加数据
                        self.dataArray.append(article)
                    
                    
                    }
                
                //刷新tableView
                    
                    self.zzTableView.reloadData()
                    
                    //结束刷新
                    
                    if from == "Header"{
                    
                    
                        self.zzTableView.header.endRefreshing()
                        self.zzTableView.footer.hidden = false
                    
                    }else{
                     
                         self.zzTableView.footer.beginRefreshing()
                    }
                    
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                }else{
                
                    self.zzTableView.footer.noticeNoMoreData()
                
                }
                
                
            
            
            }
            
            
        
        
        
        
        
        
        
        
        
        
        
        }
    
    
    }
    
    func createTableView(){
    
    
        let zzTableView: UITableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        zzTableView.delegate = self
        zzTableView.dataSource = self
        zzTableView.backgroundColor = UIColor.cyanColor()
        self.zzTableView = zzTableView
        self.view .addSubview(zzTableView)
        
    
    
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.dataArray.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell: zzArticleCell = zzArticleCell.cellWithTableView(tableView)
        
        cell.articleLabel.text = self.dataArray[indexPath.row].title as String!
        cell.articleImgeView.sd_setImageWithURL(NSURL(string: self.dataArray[indexPath.row].img as String!), placeholderImage: UIImage(named: "default_showPic.png"))
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        println(",,,,")
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 110
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
