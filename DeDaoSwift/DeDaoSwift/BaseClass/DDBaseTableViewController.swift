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
class DDBaseTableViewController: DDBaseViewController {

    
    /// 设置tableViewStyle 默认plain
    var tableViewStyle : UITableViewStyle?
    
    /// 有几个section 默认为1
    var sectionCount = 1
    
    
   public lazy var tableView : UITableView = { [unowned self] in
        let tableView = UITableView(frame: self.view.bounds, style: self.tableViewStyle!)
    
        tableView.delegate = self
        tableView.dataSource = self
    
        return tableView;
        
    }()
    
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
        view.addSubview(tableView)

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

extension DDTableViewController : SDCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        
    }
}
