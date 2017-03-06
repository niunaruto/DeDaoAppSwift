//
//  DDTableViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/2.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper
class DDTableViewController: DDBaseTableViewController {

    var bannerImageUrlArray = Array<String>()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    

  
}
extension DDTableViewController {
  
    override func initialize() {
        super.initialize()
         titleName = "首页"
    }
    
    override func initializeData() {
        super.initializeData()
        let dic = DDTool.getDictionaryWithPatch(fileName:"homeJsonData.json") as? Dictionary<String, Any>
        
        
        let  model = Mapper<DDHomeModel>().map(JSON: dic ?? ["":""])
        guard model?.c?.data?.slider?.list != nil else {
            return
        }
        for  list in (model?.c?.data?.slider?.list)! {
            bannerImageUrlArray.append(list.m_img)
            print(list.m_img)
            
        }

    }
    override func initializeUI() {
        super.initializeUI()
        
        
        let banner = SDCycleScrollView(frame: CGRect(x: 0, y: -140, width: UIScreen.main.bounds.size.width, height: 140), delegate: self, placeholderImage: UIImage(named: ""))
        banner?.imageURLStringsGroup = bannerImageUrlArray
        banner?.autoScrollTimeInterval = 4
        tableView.addSubview(banner!)
        tableView.contentInset = UIEdgeInsetsMake(140, 0, 0, 0)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseIdentifier")

    }
}
extension DDTableViewController {
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = "index = =\(indexPath.row)"
        return cell
    }
    
}

