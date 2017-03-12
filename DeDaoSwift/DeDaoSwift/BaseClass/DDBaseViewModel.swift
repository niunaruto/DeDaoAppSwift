//
//  DDBaseViewModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/3.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDBaseViewModel: NSObject {
    var shouldFetchLocalDataOnViewModelInitialize = true
//    var shouldRequestRemoteDataOnViewDidLoad = true
    var title = ""

    
    
    
}


extension DDBaseViewModel {
    
}


// MARK: 子类需要重写的方法 获取网络数据
extension DDBaseViewModel {
    
    /// 刷新数据
    ///
    /// - Parameters:
    ///   - success: 请求成功的回调
    ///   - failure: 失败回调
    func refreshData(_: (_ list : Array<Any>)->(),_:((_ erroeMessege:String?)->())) {
        
    }
    
    /// 请求更多数据
    ///
    /// - Parameters:
    ///   - success: 请求成功的回调
    ///   - failure: 失败回调
    func refreshMoreData(_:(_ list : Array<Any>)->(),_:((_ erroeMessege:String?)->())) {
        
    }
    
    
}

