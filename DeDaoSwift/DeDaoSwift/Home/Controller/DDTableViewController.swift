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

    
    lazy var vm = DDHomeViewModel()

    override func viewDidLoad() {

        super.viewDidLoad()
        setLeftSearchNavItem()
        setRightNavItems()
        tableView.register(DDHomeTableHeadView.classForCoder(), forHeaderFooterViewReuseIdentifier: DDHomeTableHeadView.cellIdentifier())

        
        
    }
    
    override func initialize() {
        super.initialize()
        self.baseVM = vm
        navigationItem.title = "发现"
        tableViewStyle = UITableViewStyle.grouped        
    }
    
    
    
    
    
    
    
    
    
    
    
   
}


