//
//  DDHomeViewModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/7.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper

class DDHomeViewModel: DDBaseTableViewModel {

    var bannerImageUrlArray = Array<String>()
    
    
    override func refreshData(_ array: (Array<Any>) -> (), _ error : ((String?) -> ())) {
        
        let dic = DDTool.getDictionaryWithPatch(fileName:"homeJsonData.json") as? Dictionary<String, Any>
        let  model = Mapper<DDHomeModel>().map(JSON: dic ?? ["":""])
        if let listTemp = model?.c?.data?.slider?.list {
            for  list in listTemp {
                bannerImageUrlArray.append(list.m_img)
            }
            array(bannerImageUrlArray)
        }else{
            error("数据错误")
        }

    }
    override func initViewModel() {
        
        sectionCount = 2
        tableViewStyle = .grouped
        sectionFooterHeight = 10
        useLoadMoreControl = false

    }
    
}

// MARK: - tabelView的相关方法
extension DDHomeViewModel{
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == 0 else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeFreeAudioCell.cellIdentifier(), for: indexPath) as! DDHomeFreeAudioCell
            
            return cell
        }
        if indexPath.row == 0 {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeBannerCell.cellIdentifier(), for: indexPath) as! DDHomeBannerCell
            
            cell.imageArray = bannerImageUrlArray
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeIndexCell.cellIdentifier(), for: indexPath) as! DDHomeIndexCell
            
            return cell
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        guard section == 0 else {
            return 44
        }
        return 0.0001
    }
}

