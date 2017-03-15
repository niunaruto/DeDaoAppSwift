//
//  DDBaseTableViewModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/3.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import ObjectMapper
public enum loadDataFinishedStatus : Int {
    
    case success
    case error
}
protocol viewModelDelegate : class {
      func loadDataFinished(_ vm : DDBaseTableViewModel, _ status : loadDataFinishedStatus)
}
class DDBaseTableViewModel: DDBaseViewModel {
    
    /// 设置tableViewStyle 默认plain
    var tableViewStyle : UITableViewStyle?
    
    /// 有几个section 默认为1
    lazy var sectionCount = 1
    
    
    lazy var useRefreshControl = true
    
    lazy var dataSource = Array<Any>()
    
    lazy var useLoadMoreControl = true
    
    
    weak var delegate : viewModelDelegate?
    
    override init() {
        super.init()
        if let style =  tableViewStyle{
            tableViewStyle = style
        }else{
            tableViewStyle = UITableViewStyle.plain
        }
        initViewModel()
    }
    
    
    
    
}

extension DDBaseTableViewModel {
    func initViewModel() {
        
    }
}


// MARK: - UITableViewDataSource,UITableViewDelegate
extension DDBaseTableViewModel : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return sectionCount
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowArray = dataSource[section] as? Array<Any>
        if let temp = rowArray {
            return temp.count
        }
        return 0;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let rowArray = dataSource[indexPath.section] as? Array<Any>
        
        configureCell(cell: cell, atIndexPath: indexPath, object: rowArray?[indexPath.row])
        return cell
        
    }
    
    func configureCell(cell : UITableViewCell,atIndexPath: IndexPath,object : Any? )  {
        
    }
}




// MARK: 子类需要重写的方法 获取网络数据
extension DDBaseTableViewModel {
    
    /// 刷新数据
    ///
    /// - Parameters:
    ///   - success: 请求成功的回调
    ///   - failure: 失败回调
    func  refreshData(_ array: (Array<Any>) -> (), _ error : ((String?) -> ())) {
        
    }
    
    /// 请求更多数据
    ///
    /// - Parameters:
    ///   - success: 请求成功的回调
    ///   - failure: 失败回调
    func refreshMoreData(_:(_ list : Array<Any>)->(),_:((_ erroeMessege:String?)->())) {
        
    }
    
    
}

