//
//  DDStudyViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/17.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDStudyViewController: DDBaseTableViewController {

    lazy var studyTopRemarkView : DDStudyTopRemarkView = {
       
        let studyTopRemarkView = DDStudyTopRemarkView(frame: CGRect(x: 0, y: -200, width: UIView.screenWidth, height: 200))
        studyTopRemarkView.backgroundColor = UIColor.orange
        return studyTopRemarkView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        setLeftSearchNavItem()
        setRightNavItems()        
        tableView.addSubview(studyTopRemarkView)
        tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0)

        
        

    }
    

    
    override func initialize() {
        super.initialize()
        tabViewModel.title = "今日学习"
        tabViewModel.useRefreshControl = false
    }
  
    
}
