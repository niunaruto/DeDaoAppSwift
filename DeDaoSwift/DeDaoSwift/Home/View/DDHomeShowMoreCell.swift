//
//  DDHomeShowMoreCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/16.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeShowMoreCell: DDBaseTableViewCell {
    
    override func setCellsViewModel(_ model: Any?) {
        if let modelT = model as? String {
            
            contentLabel.text = modelT
        }
    }

    lazy var contentLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#999999")
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        return titleLabel
    }()
    
    override func setUI() {
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(40)
            make.bottom.top.equalToSuperview()
        }
    }

}
