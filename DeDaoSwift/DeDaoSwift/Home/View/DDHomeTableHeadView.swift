//
//  DDHomeTableHeadView.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/14.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeTableHeadView: DDBaseTableHeaderFooterView {
    
    lazy var leftLabel : UILabel = {
        let leftLabel = UILabel()
        leftLabel.textColor = UIColor.init("#333333")
        leftLabel.font = UIFont.systemFont(ofSize: 13)
        return leftLabel
    }()
    
    lazy var rightLabel : UILabel = {
        let rightLabel = UILabel()
        rightLabel.textColor = UIColor.init("#999999")
        rightLabel.font = UIFont.systemFont(ofSize: 12)
        return rightLabel
    }()
    
    
    
    
    override func setUI() {
        contentView.addSubview(leftLabel)
        contentView.addSubview(rightLabel)
        let rightImageView = UIImageView(image: UIImage(named: "new_main_subscribe_right"))
        contentView.addSubview(rightImageView)
        rightImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(0)
        }
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.init("#efefef")
        contentView.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.right.equalTo(rightImageView.snp.right).offset(-10)
            make.left.equalTo(leftLabel.snp.left)
            make.height.equalTo(1)
        }
        leftLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        rightLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(rightImageView.snp.left).offset(-3)
        }
        
        
    }
    
    

}
