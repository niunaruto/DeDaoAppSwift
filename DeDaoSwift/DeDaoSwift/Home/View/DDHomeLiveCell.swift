//
//  DDHomeLiveCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/15.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeLiveCell: DDBaseTableViewCell {
    
    
    override func setCellsViewModel(_ model: Any?) {
        if let modelT = model as? DDHomeLiveDataModel {
            titleLabel.text  = modelT.title
            subDescLabel.text = modelT.intro
        }
    }
    
    lazy var titleLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#333333")
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        return titleLabel
    }()
    lazy var subDescLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#666666")
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        return titleLabel
    }()
    
    
    
    override func setUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subDescLabel)
        
        let rightImageView = UIImageView(image: UIImage(named: "new_main_subscribe_right"))
        contentView.addSubview(rightImageView)
        rightImageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(-17)
            make.top.equalToSuperview().offset(17)
        }
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp.centerY).offset(-3)
            make.left.equalToSuperview().offset(10)
        }
        subDescLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.left.equalTo(titleLabel.snp.left)
        }
    }

}
