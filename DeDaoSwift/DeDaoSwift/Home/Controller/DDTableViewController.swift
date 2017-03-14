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
        
        tableView.register(DDHomeBannerCell.classForCoder(), forCellReuseIdentifier: DDHomeBannerCell.cellIdentifier())
        tableView.register(DDHomeIndexCell.classForCoder(), forCellReuseIdentifier: DDHomeIndexCell.cellIdentifier())
        tableView.register(DDHomeFreeAudioCell.classForCoder(), forCellReuseIdentifier: DDHomeFreeAudioCell.cellIdentifier())
        
    }
    
    override func initialize() {
        super.initialize()
        tabViewModel.title = "首页"

        

    }
    
   
}


