//
//  UITableView+Extension.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/16.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import Foundation

extension UITableView {
    func cellForIndexPath(_ indexPath: IndexPath, cellClass: AnyClass?) -> DDBaseTableViewCell? {
        if (cellClass?.isSubclass(of: DDBaseTableViewCell.self))! {
            let identifier = NSStringFromClass(cellClass!) + "CELL_ID"
            var cell = self.dequeueReusableCell(withIdentifier: identifier)
            if cell == nil {
                self.register(cellClass, forCellReuseIdentifier: identifier)
                cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            }
            return cell as! DDBaseTableViewCell?
        }
        return nil
    }
    
    
    
}
