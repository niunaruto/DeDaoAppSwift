//
//  DDBaseTableHeaderFooterView.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/14.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDBaseTableHeaderFooterView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white

        setUI()
        setLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension DDBaseTableHeaderFooterView {
    func setUI() {
        
    }
    
    func setLayout() {
        
    }
}
 
