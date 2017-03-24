//
//  DDstudyDailyverseCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/23.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDstudyDailyverseCell: DDBaseTableViewCell {

    override func setCellsViewModel(_ model: Any?) {
        if let modelT = model as? DDStudyDailyVerseDataModel {
            weekLabel.text = modelT.week
            dayLabel.text = modelT.day
            referer_groupLabel.text = modelT.referer_group
            referer_nameLabel.text = modelT.referer_name
            fromLabel.text = modelT.from
            contentLabel.text  = modelT.content
            
        }
    }
    
    
    lazy var weekLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.textColor = UIColor.white
        tempLabel.font = UIFont.systemFont(ofSize: 18)
        return tempLabel
    }()
    lazy var dayLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.textColor = UIColor.white
        tempLabel.font = UIFont.systemFont(ofSize: 16)
        return tempLabel
    }()
    
    lazy var referer_groupLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.textColor = UIColor.white
        tempLabel.font = UIFont.systemFont(ofSize: 13)
        return tempLabel
    }()
    
    
    lazy var referer_nameLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.textColor = UIColor.white
        tempLabel.font = UIFont.systemFont(ofSize: 13)
        return tempLabel
    }()
    
    lazy var fromLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.textColor = UIColor.white
        tempLabel.font = UIFont.systemFont(ofSize: 13)
        return tempLabel
    }()
    lazy var contentLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.textColor = UIColor.white
        tempLabel.numberOfLines = 0
        tempLabel.font = UIFont.systemFont(ofSize: 13)
        return tempLabel
    }()
    
    
    
    override func setUI() {
        
        let backContentView = UIView()
        contentView.addSubview(backContentView)
        backContentView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview()
            make.right.bottom.equalToSuperview().offset(-10)
        }
        backContentView.backgroundColor = UIColor.brown

        let blodContentView = UIView()
        blodContentView.layer.borderColor = UIColor.white.cgColor
        blodContentView.layer.borderWidth = 1
        blodContentView.layer.masksToBounds = true
        blodContentView.backgroundColor = backContentView.backgroundColor
        backContentView.addSubview(blodContentView)
        
        blodContentView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            //make.top.equalToSuperview()
            make.right.bottom.equalToSuperview().offset(-10)
        }
        
        
        
        
        blodContentView.addSubview(weekLabel)
        blodContentView.addSubview(dayLabel)
        blodContentView.addSubview(referer_groupLabel)
        blodContentView.addSubview(referer_nameLabel)
        blodContentView.addSubview(fromLabel)
        blodContentView.addSubview(contentLabel)
        
        
        
        
        let viewLine = UIView()
        viewLine.backgroundColor = UIColor.white
        blodContentView.addSubview(viewLine)
        viewLine.snp.makeConstraints { (make) in
            make.left.equalTo(weekLabel);
            make.height.equalTo(1);
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(dayLabel.snp.bottom).offset(10)
        }
        
        
        weekLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(10)
        }
        dayLabel.snp.makeConstraints { (make) in
            make.left.equalTo(weekLabel)
            make.top.equalTo(weekLabel.snp.bottom).offset(3)
        }
        
        
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(weekLabel)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(viewLine.snp.bottom).offset(10)
        }
        referer_groupLabel.snp.makeConstraints { (make) in
            make.left.equalTo(weekLabel);
            make.top.equalTo(contentLabel.snp.bottom).offset(10);
            make.bottom.equalToSuperview().offset(-40);//临时代码
        }
        referer_nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(referer_groupLabel.snp.right).offset(8);
            make.centerY.equalTo(referer_groupLabel);
        }
        
        
        
        
        
        
        
    }

}
