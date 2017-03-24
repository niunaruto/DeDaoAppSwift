//
//  DDStudyViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/17.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDStudyViewController: DDBaseTableViewController{

    
    let vm = DDStudyViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(DDStudyHeadView.classForCoder(), forHeaderFooterViewReuseIdentifier: DDStudyHeadView.cellIdentifier())
        setLeftSearchNavItem()
        setRightNavItems()
        
    }
    
    
    override func initialize() {
        super.initialize()
        self.baseVM = vm

    }
    override func endRefreshing() {
        super.endRefreshing()
        let index = IndexPath(row: 0, section: 0)
        if let view = self.tableView.cellForRow(at: index) {
            vm.setingScreensHotView(view)
            self.view.addSubview(vm.screensHotView)
        }
    }
    
    
   
    
}

