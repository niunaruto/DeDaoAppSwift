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

    lazy var tableViewStyle = UITableViewStyle.plain
    lazy var baseVM = DDBaseTableViewModel()
    
    lazy var tableView : UITableView = { [unowned self] in
        let tableView = UITableView(frame: CGRect.zero, style: self.tableViewStyle)
        tableView.estimatedRowHeight = 140
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        tableView.delegate = self.baseVM
        tableView.dataSource = self.baseVM
        tableView.separatorStyle = .none
        return tableView;
        
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        baseVM.delegate = self
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        
        tableView.mj_footer = MJRefreshBackFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMoreData))
        
        tableView.mj_header.beginRefreshing()
        
    }
    
    
}

extension DDBaseTableViewController{
    override func initialize() {
        super.initialize()
    }
}


extension DDBaseTableViewController : DDBaseCellProtocol {
    func tableCell(cell: DDBaseTableViewCell, didTrigerEvent: DDCellEventType, params: Dictionary<String, Any>?) {
        
        
    }
}

// MARK: - 刷新数据相关方法
extension DDBaseTableViewController {
    
    
    /// 下拉刷新
    func loadNewData() {

        baseVM.refreshNewData()
    }
    
    func loadMoreData() {        
        baseVM.loadMoreData()

    }
}


extension DDBaseTableViewController : viewModelDelegate {

    func loadDataFinished(_ vm: Any, _ status: loadDataFinishedStatus) {

        guard status == .success else {
            endRefreshing()
            return
        }
        endRefreshing()
        tableView.reloadData()
        
    }
    
    func endRefreshing() {
        if baseVM.useRefreshControl {
            tableView.mj_header.endRefreshing()
        }
        if baseVM.useLoadMoreControl {
            tableView.mj_footer.endRefreshing()
        }
    }

    
    
}



