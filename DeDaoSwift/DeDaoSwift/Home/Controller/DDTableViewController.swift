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
        setRightNavItems(["navbar_playing_icon_anim_1","navbar_playing_icon_anim_1"])
        tableView.register(DDHomeTableHeadView.classForCoder(), forHeaderFooterViewReuseIdentifier: DDHomeTableHeadView.cellIdentifier())
        
        
    }
    
    override func initialize() {
        super.initialize()
        tabViewModel.title = "发现"
    }
    
    
    
   
}


