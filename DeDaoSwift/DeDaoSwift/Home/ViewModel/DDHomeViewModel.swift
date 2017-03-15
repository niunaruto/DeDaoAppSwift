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

    lazy var  homeModel : Dictionary? = Dictionary<String, Any>()
    
    var dataModel  = Mapper<DDHomeDataModel>().map(JSON : ["":""])

    lazy var typeModelArray = Array<DDHomePositionStructureModel>()
    
    override func refreshData(_ array: (Array<Any>) -> (), _ error : ((String?) -> ())) {
        
        let typeDic = DDTool.getDictionaryWithPatch(fileName: "homePositionData.json") as? Dictionary<String, Any>
        let typeModel = Mapper<DDHomePositionModel>().map(JSON: typeDic ?? ["":""])
        if let tempArray = typeModel?.c?.structure {
            typeModelArray = tempArray
        }
        
        
        let dic = DDTool.getDictionaryWithPatch(fileName:"homeJsonData.json") as? Dictionary<String, Any>
        let model = Mapper<DDHomeModel>().map(JSON: dic ?? ["":""])
        
        dataModel = model?.c?.data
        
        
        
        if let listTemp = dataModel?.slider?.list {
            bannerImageUrlArray.removeAll()
            for  list in listTemp {
                bannerImageUrlArray.append(list.m_img) //append追加
            }
            array(bannerImageUrlArray)
        }else{
            error("数据错误")
        }

    }
    override func initViewModel() {
        
        tableViewStyle = .grouped
        useLoadMoreControl = false

    }
    
}

// MARK: - tabelView的相关方法
extension DDHomeViewModel{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard typeModelArray.count == 0 else {
            
            return typeModelArray.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        let type = typeModelArray[section].type
        if type == "category" {
            return 2
        }else if type == "column" {
            return 3
        }else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        
        let type = typeModelArray[section].type

        if type == "category" {
            if row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeBannerCell.cellIdentifier(), for: indexPath) as! DDHomeBannerCell
                cell.setCellsViewModel(dataModel?.slider)
                return cell
            }else{
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeIndexCell.cellIdentifier(), for: indexPath) as! DDHomeIndexCell
                
                return cell
            }
        }else if type == "column" {

            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeColumnCell.cellIdentifier(), for: indexPath) as! DDHomeColumnCell

            cell.setCellsViewModel(dataModel?.column?.list?[indexPath.row])
            return cell
            
        }else if type == "freecolumn" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeFreeColumnCell.cellIdentifier(), for: indexPath) as! DDHomeFreeColumnCell
            cell.setCellsViewModel(dataModel?.freecolumn)
            return cell
            
        }else if type == "live" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeLiveCell.cellIdentifier(), for: indexPath) as! DDHomeLiveCell
            cell.setCellsViewModel(dataModel?.live?.data)
            return cell
        }else if type == "freeAudio" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeFreeAudioCell.cellIdentifier(), for: indexPath) as! DDHomeFreeAudioCell
            cell.setCellsViewModel(dataModel?.freeAudio)

            return cell
        }else if type == "magazine" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeMagazineCell.cellIdentifier(), for: indexPath) as! DDHomeMagazineCell
            cell.setCellsViewModel(dataModel?.magazine?.data)
            return cell
        }else if type == "storytell" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeStorytellCell.cellIdentifier(), for: indexPath) as! DDHomeStorytellCell
            cell.setCellsViewModel(dataModel?.storytell?.data)
            
            return cell
        }else if type == "dataMiningAduioOrBook" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeHotAndGustCell.cellIdentifier(), for: indexPath) as! DDHomeHotAndGustCell
            cell.setCellsViewModel(dataModel?.dataMiningAduioOrBook)
            
            return cell
        }else if type == "new" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeHotAndGustCell.cellIdentifier(), for: indexPath) as! DDHomeHotAndGustCell
            cell.setCellsViewModel(dataModel?.new)
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DDHomeSubjectCell.cellIdentifier(), for: indexPath) as! DDHomeSubjectCell
            cell.setCellsViewModel(dataModel?.subject)
            return cell
        }
        
        
       
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard section == 0 else {
            
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: DDHomeTableHeadView.cellIdentifier()) as! DDHomeTableHeadView
            
            return view
            
        }
        return nil
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        guard section == 0 else {
            return 44
        }
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
}

