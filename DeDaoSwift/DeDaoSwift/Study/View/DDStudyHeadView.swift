//
//  DDStudyHeadView.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/23.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDStudyHeadView: DDBaseTableHeaderFooterView {

    override func setHeadFootViewModel(_ model: Any?) {
        
    }
    
    lazy var leftLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.textColor = UIColor.init("#666666")
        tempLabel.font = UIFont.systemFont(ofSize: 20)
        return tempLabel
    }()
    
    
    override func setUI() {
        contentView.addSubview(leftLabel)
        contentView.backgroundColor = UIColor.red
        
    }
    override func setLayout() {
        leftLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
    }
    
    

}
