//
//  DDStudyViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/17.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import MJRefresh
class DDStudyViewController: DDBaseTableViewController,UITableViewDelegate,UITableViewDataSource {

    
    
     lazy var tableView2 : UITableView = { [unowned self] in
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
 
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        return tableView;
        
        }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLeftSearchNavItem()
        setRightNavItems()
        tableView.backgroundColor = UIColor.brown
        
        let studyTopRemarkView = DDStudyTopRemarkView()
        studyTopRemarkView.backgroundColor = UIColor.red

        
        
        
        tableView.addSubview(tableView2)
        
        tableView2.addSubview(studyTopRemarkView)
        studyTopRemarkView.frame = CGRect(x: 0, y: -200, width: UIView.screenWidth, height: 200)
        
        
        tableView2.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        tableView2.frame = CGRect(x:0, y: 0, width: UIView.screenWidth, height: UIView.screenHeight)
    
        

        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 90
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
    }
  
    
}
