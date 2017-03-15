//
//  DDHomeColumnCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/15.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeColumnCell: DDBaseTableViewCell {
    
    
    override func setCellsViewModel(_ model: Any?) {
        if let modelT = model as? DDHomeColumnListModel {
            leftImage.kf.setImage(with: URL(string: modelT.m_img))
            
            subDescLabel.text = modelT.m_intro
            titleLabel.text = modelT.m_title
            bottomContextLabel.text = modelT.m_article_title
            timerLabel.text = " \(modelT.m_article_time) "
            moneyLabel.text = "￥\(modelT.m_price)/年"
        }
    }
    
    lazy var leftImage : UIImageView = {
        
        let leftImage = UIImageView()
        leftImage.layer.masksToBounds  = true
        leftImage.layer.cornerRadius = 5
        return leftImage
    }()
    
    lazy var subDescLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#999999")
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        return titleLabel
    }()
    lazy var titleLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#333333")
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        return titleLabel
    }()
    lazy var timerLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#999999")
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        
        titleLabel.layer.borderColor = UIColor.init("#999999").cgColor
        titleLabel.layer.borderWidth = 0.5
        titleLabel.layer.cornerRadius = 2.0
        titleLabel.layer.masksToBounds = true
        return titleLabel
    }()
    lazy var bottomContextLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#666666")
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        return titleLabel
    }()
    lazy var moneyLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.orange
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        return titleLabel
    }()
    
    
   
    override func setUI() {
        contentView.addSubview(leftImage)
        contentView.addSubview(moneyLabel)
        contentView.addSubview(bottomContextLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(timerLabel)
        contentView.addSubview(subDescLabel)
        
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.init("#efefef")
        contentView.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview()
            make.left.equalTo(leftImage.snp.left)
            make.height.equalTo(1)
        }
    }
    
    override func setLayout() {
        leftImage.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(120)
            make.width.equalTo(90)
        }
        
        subDescLabel.snp.makeConstraints { (make) in
            make.left.equalTo(leftImage.snp.right).offset(10)
            make.bottom.equalTo(contentView.snp.centerY).offset(-6)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(subDescLabel.snp.left)
            make.bottom.equalTo(subDescLabel.snp.top).offset(-6)
        }
        
        timerLabel.snp.makeConstraints { (make) in
            make.left.equalTo(subDescLabel.snp.left)
            make.top.equalTo(leftImage.snp.centerY).offset(6)
            make.height.equalTo(16)
        }
        
        bottomContextLabel.snp.makeConstraints { (make) in
            make.left.equalTo(subDescLabel.snp.left)
            make.top.equalTo(timerLabel.snp.bottom).offset(6)
        }
        moneyLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        
        
        
    }

}
