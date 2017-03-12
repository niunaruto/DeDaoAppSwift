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

    
    var bannerImageUrlArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func initializeData() {
        super.initializeData()
        let dic = DDTool.getDictionaryWithPatch(fileName:"homeJsonData.json") as? Dictionary<String, Any>
        let  model = Mapper<DDHomeModel>().map(JSON: dic ?? ["":""])
        
        if let listTemp = model?.c?.data?.slider?.list {
            for  list in listTemp {
                bannerImageUrlArray.append(list.m_img)
            }
        }
    }
    override func registerCells() {
        tableView.register(DDHomeBannerCell.classForCoder(), forCellReuseIdentifier: DDHomeBannerCell.cellIdentifier())
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeBannerCell.cellIdentifier(), for: indexPath) as! DDHomeBannerCell
        
        cell.imageArray = bannerImageUrlArray
        return cell
        
    }
}

