//
//  DDTableViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/2.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDTableViewController: DDBaseTableViewController {

   
    
    override func viewDidLoad() {

        super.viewDidLoad()
        setLeftSearchNavItem()
        
        tableView.register(DDHomeHotAndGustCell.classForCoder(), forCellReuseIdentifier: DDHomeHotAndGustCell.cellIdentifier())
        tableView.register(DDHomeMagazineCell.classForCoder(), forCellReuseIdentifier: DDHomeMagazineCell.cellIdentifier())
        tableView.register(DDHomeStorytellCell.classForCoder(), forCellReuseIdentifier: DDHomeStorytellCell.cellIdentifier())
        tableView.register(DDHomeColumnCell.classForCoder(), forCellReuseIdentifier: DDHomeColumnCell.cellIdentifier())
        tableView.register(DDHomeLiveCell.classForCoder(), forCellReuseIdentifier: DDHomeLiveCell.cellIdentifier())
        tableView.register(DDHomeFreeColumnCell.classForCoder(), forCellReuseIdentifier: DDHomeFreeColumnCell.cellIdentifier())
        tableView.register(DDHomeBannerCell.classForCoder(), forCellReuseIdentifier: DDHomeBannerCell.cellIdentifier())
        tableView.register(DDHomeIndexCell.classForCoder(), forCellReuseIdentifier: DDHomeIndexCell.cellIdentifier())
        tableView.register(DDHomeFreeAudioCell.classForCoder(), forCellReuseIdentifier: DDHomeFreeAudioCell.cellIdentifier())
        tableView.register(DDHomeTableHeadView.classForCoder(), forHeaderFooterViewReuseIdentifier: DDHomeTableHeadView.cellIdentifier())
        
    }
    
    override func initialize() {
        super.initialize()
        tabViewModel.title = "首页"
    }
    
    
    
   
}


