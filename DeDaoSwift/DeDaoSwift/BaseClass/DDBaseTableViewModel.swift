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
     func loadDataFinished(_ vm : Any, _ status : loadDataFinishedStatus)
}
class DDBaseTableViewModel: DDBaseViewModel {
    
    /// 设置tableViewStyle 默认plain
    var tableViewStyle : UITableViewStyle?
    
    lazy var dataArray = Array<Any>()
    
    lazy var useRefreshControl = true
    
    lazy var useLoadMoreControl = true
    
    var cellClass : AnyClass?
    var headFootViewClass : AnyClass?
    
    var model : Any?
    
    
    
    
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
    
    init(_ model : Any? = nil ,_ cellClass : AnyClass? = nil) {
        self.model = model
        self.cellClass = cellClass
    }
    
}

extension DDBaseTableViewModel {
    func initViewModel() {
        
    }
}


// MARK: - DDBaseTableViewModel,UITableViewDataSource
extension DDBaseTableViewModel : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = dataAtIndexPath(indexPath)
        let cell: DDBaseTableViewCell = tableView.cellForIndexPath(indexPath, cellClass: vm.cellClass)!
        cell.setCellsViewModel(vm.model)
        cell.delegate = self
        return cell
    }
    
    
    
    func dataAtIndexPath(_ indexPath : IndexPath) -> DDBaseTableViewModel {
        
        return DDBaseTableViewModel.init()
    }
    
    
    
    
}
extension DDBaseTableViewModel : DDBaseCellProtocol {
    
    func tableCell(cell: DDBaseTableViewCell, didTrigerEvent: DDCellEventType, params: Dictionary<String, Any>?) {
        
    }
}



// MARK: - 提供给控制器的刷新 方法
extension DDBaseTableViewModel {
    func refreshNewData() {
        refreshData({ (list) in
            dataArray.removeAll()
            if list.count > 0 {
                
                for i in 0...(list.count - 1) {
                    
                    /// 数据包装成model
                    let vm = createViewModelWithModel(list[i])
                    dataArray.append(vm)
                }
                
            }
            delegate?.loadDataFinished(list, .success)

        }) { (errorMessege) in
            
            delegate?.loadDataFinished(errorMessege, .error)

        }
    }
    
    func loadMoreData() {
        
        refreshMoreData({ (list) in
            
            delegate?.loadDataFinished(list, .success)

            
        }) { (errorMessege) in
            delegate?.loadDataFinished(errorMessege, .error)

        }
    }
}

extension DDBaseTableViewModel {
    func createViewModelWithModel(_ model : Any? = nil ,_ cellClass : AnyClass? = nil) -> DDBaseTableViewModel{
        
        return DDBaseTableViewModel.init(model, cellClass)
    }
    
}



// MARK: 子类需要重写的方法 获取网络数据
extension DDBaseTableViewModel {
    
    /// 刷新数据
    ///
    /// - Parameters:
    ///   - success: 请求成功的回调
    ///   - failure: 失败回调
    func  refreshData(_ array: (Array<Any>) -> (), _ error : ((String) -> ())) {
        
    }
    
    /// 请求更多数据
    ///
    /// - Parameters:
    ///   - success: 请求成功的回调
    ///   - failure: 失败回调
    func refreshMoreData(_:(_ list : Array<Any>)->(),_:((_ erroeMessege:String)->())) {
        
    }
    
    
}

