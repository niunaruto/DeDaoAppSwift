//
//  DDStudyTopRemarkView.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/17.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import MJRefresh
class DDStudyTopRemarkView: UIView {

    lazy var tableView : UITableView = { [unowned self] in
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")

        return tableView;
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setUI()
//        tableView.rowHeight = frame.size.height
//        tableView.frame = frame
//        tableView.mj_y = 0
//        tableView.mj_h = 44
//        tableView.mj_header.beginRefreshing()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        addSubview(tableView)
        
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(pullRefresh))

        
        tableView.mj_header.backgroundColor = UIColor.red
        
        
        
    }
    func pullRefresh() {
        sleep(2)
        tableView.mj_header.endRefreshing()
    }

}

extension DDStudyTopRemarkView : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
        
    }
}
