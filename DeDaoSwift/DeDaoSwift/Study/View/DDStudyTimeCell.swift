//
//  DDStudyTimeCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/23.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDStudyTimeCell: DDBaseTableViewCell {

    
    lazy var fromView : UIView = {
        let tempLabel = UIView()
        tempLabel.backgroundColor = UIColor.yellow
        return tempLabel
    }()
    
    override func setUI() {
        contentView.addSubview(fromView)
        fromView.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview().offset(-10)
            make.left.top.equalToSuperview().offset(10)
            make.height.equalTo(80)
        }
    }
    
}
