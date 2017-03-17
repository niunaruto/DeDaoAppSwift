//
//  DDStudyViewModel.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/17.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDStudyViewModel: DDBaseTableViewModel {

    
    
    override func initViewModel() {
        useLoadMoreControl = false
    }
    
    override func refreshData(_ array: (Array<Any>) -> (), _ error: ((String) -> ())) {
        
        array([])
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func createViewModelWithModel(_ model: Any?, _ cellClass: AnyClass?) -> DDBaseTableViewModel {
        return DDStudyViewModel.init(model, cellClass)
    }
    
    override func dataAtIndexPath(_ indexPath: IndexPath) -> DDBaseTableViewModel {
        let vm = DDStudyViewModel.init("", DDStudyTopRemarkViewCell.classForCoder())
        
        return vm
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
