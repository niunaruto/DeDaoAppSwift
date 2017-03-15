//
//  DDHomeStorytellCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/15.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeStorytellCell: DDBaseTableViewCell {
    
    override func setCellsViewModel(_ model: Any?) {
        if let modelT = model as? DDHomeStorytellDataModel {
            leftImage.kf.setImage(with: URL(string: modelT.m_img))
            
            timerLabel.text = timeFormatted(modelT.m_duration)
            moneyLabel.text = "￥\(modelT.m_price)"
            if let name =  modelT.m_info?.name{
                subDescLabel.text = "\(name) 陈述"
            }
            titleLabel.text = modelT.m_title
            infoLable.text = modelT.m_description
        }
    }
    
    lazy var leftImage : UIImageView = {
        
        let leftImage = UIImageView()
        
        return leftImage
    }()
    
    
    
    lazy var subDescLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#999999")
        titleLabel.font = UIFont.systemFont(ofSize: 10)
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
        return titleLabel
    }()
    lazy var infoLable : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#999999")
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        return titleLabel
    }()
    
    lazy var moneyLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.orange
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        return titleLabel
    }()
    
    lazy var buyButton : UIButton = {
       
        let buyButton = UIButton()
        
        buyButton.layer.borderColor = UIColor.orange.cgColor
        buyButton.layer.borderWidth = 0.5
        buyButton.layer.cornerRadius = 12.0
        buyButton.layer.masksToBounds = true
        buyButton.setTitle("购买", for: .normal)
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        buyButton.setTitleColor(UIColor.orange, for: .normal)
        return buyButton
    }()
    
    
    override func setUI() {
        contentView.addSubview(leftImage)
        contentView.addSubview(timerLabel)
        contentView.addSubview(moneyLabel)
        contentView.addSubview(infoLable)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subDescLabel)
        contentView.addSubview(buyButton)
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
        infoLable.snp.makeConstraints { (make) in
            make.top.equalTo(leftImage.snp.centerY).offset(6)
            make.left.equalTo(subDescLabel.snp.left)
        }
        
        moneyLabel.snp.makeConstraints { (make) in
            make.left.equalTo(subDescLabel.snp.left)
            make.bottom.equalTo(leftImage.snp.bottom).offset(-10)
            
        }
        timerLabel.snp.makeConstraints { (make) in
            make.left.equalTo(moneyLabel.snp.right).offset(15)
            make.centerY.equalTo(moneyLabel.snp.centerY)
        }
        
        buyButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(moneyLabel.snp.centerY)
            make.width.equalTo(48)
        }
        
        
    }
    
    
    func timeFormatted(_ seconds : CGFloat ) -> String {
        let s : Int = Int(seconds) / 60
        let minutes : Int = (Int(seconds) / 60) % 60;
        
        return "时长:\(minutes)分\(s)秒"
    }
    
}
