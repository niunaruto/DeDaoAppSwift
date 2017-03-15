//
//  DDBaseTableViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/3.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import SnapKit
import ObjectMapper
import MJRefresh
import ReactiveSwift
//import ReactiveCocoa



class DDBaseTableViewController: DDBaseViewController {

    
    lazy var tabViewModel : DDBaseTableViewModel =  { [unowned self] in
        let  tabViewModel  = DDBaseTableViewModel()
        return tabViewModel
    }()
    
   public lazy var tableView : UITableView = { [unowned self] in
        let tableView = UITableView(frame: self.view.bounds, style: self.tabViewModel.tableViewStyle!)
        tableView.estimatedRowHeight = 140
        tableView.delegate = self.tabViewModel
        tableView.dataSource = self.tabViewModel
        tableView.separatorStyle = .none
        return tableView;
        
    }()
    
     init(viewMode : DDBaseTableViewModel) {

        super.init(nibName: nil, bundle: nil)
        self.tabViewModel = viewMode
        self.viewModel = self.tabViewModel


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        view.addSubview(tableView)
        if tabViewModel.useRefreshControl {
            
            tableView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(pullRefresh))
            tableView.mj_header.beginRefreshing()
        }
        
        if tabViewModel.useLoadMoreControl {
            tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMoreMoreData))
            
        }

    }
}

extension DDBaseTableViewController{
    override func initialize() {
        super.initialize()
    }
}

// MARK: - 刷新数据相关方法
extension DDBaseTableViewController {
    
    
    /// 下拉刷新
    func pullRefresh() {
        
        tabViewModel.refreshData({ (array) in

            tableView.mj_header.endRefreshing()
            tableView.reloadData()
            tabViewModel.delegate?.loadDataFinished(tabViewModel, .success)
            
            
        }) { (errorMessege) in
            tableView.mj_header.endRefreshing()
            tabViewModel.delegate?.loadDataFinished(tabViewModel, .error)

        }
    }
    
    func loadMoreMoreData() {
        
    }
}




