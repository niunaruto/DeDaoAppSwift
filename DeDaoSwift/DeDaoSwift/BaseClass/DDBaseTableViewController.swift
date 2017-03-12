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
import ReactiveCocoa
class DDBaseTableViewController: DDBaseViewController {

    
    /// 设置tableViewStyle 默认plain
    var tableViewStyle : UITableViewStyle?
    
    /// 有几个section 默认为1
    var sectionCount = 1
    
    var viewModel = DDBaseViewModel()
    
    var useRefreshControl = true
    
    var useLoadMoreControl = true
    
    
    
    
   public lazy var tableView : UITableView = { [unowned self] in
        let tableView = UITableView(frame: self.view.bounds, style: self.tableViewStyle!)
        tableView.estimatedRowHeight = 140

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView;
        
    }()
    
     init(viewMode : DDBaseViewModel) {

        super.init(nibName: nil, bundle: nil)
        viewModel = viewMode

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    
    }
    
    override func initialize() {
        super.initialize()
    }
    override func initializeData() {
        super.initializeData()
        
        if let style =  tableViewStyle{
            tableViewStyle = style
        }else{
            tableViewStyle = UITableViewStyle.plain
        }
    }
    override func initializeUI() {
        super.initializeUI()
        registerCells()
        view.addSubview(tableView)

    }

    func registerCells()  {
     
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }
    
    /// 下拉刷新
    func pullRefresh() {
        
        
    }
    
    func loadMoreMoreData() {
        
    }
    
}



extension DDBaseTableViewController : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
        
    }
}
