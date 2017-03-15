//
//  DDHomeMagazineCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/15.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeMagazineCell: DDBaseTableViewCell {

    
    override func setCellsViewModel(_ model: Any?) {
        if let modelT = model as? DDHomeStorytellDataModel {
            
            if modelT.m_buy == 0 {
                leftImage.kf.setImage(with: URL(string: modelT.m_notbuy_image))

            }else{
                leftImage.kf.setImage(with: URL(string: modelT.m_img))

            }
            
//            subDescLabel.text = modelT.m_source
//            infoLable.text = modelT.m_description
//            
//            
//            titleLabel.text = modelT.m_title

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
        titleLabel.font = UIFont.systemFont(ofSize: 10)
        return titleLabel
    }()
    lazy var titleLabel : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#333333")
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        return titleLabel
    }()
    
    lazy var infoLable : UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#999999")
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        return titleLabel
    }()
    
    
    lazy var infoButton : UIButton = {
        
        let infoButton = UIButton()
        
        infoButton.backgroundColor = UIColor.orange
        infoButton.setTitle("查看详情", for: .normal)
        infoButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        infoButton.setTitleColor(UIColor.white, for: .normal)
        return infoButton
    }()
    
    override func setUI() {
        contentView.addSubview(leftImage)
//        contentView.addSubview(infoButton)
//        contentView.addSubview(infoLable)
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(subDescLabel)

    }
    
    override func setLayout() {
        leftImage.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.height.equalTo(200)
            make.bottom.right.equalToSuperview().offset(-10)
        }
        
//        let newLabel = UILabel()
//        contentView.addSubview(newLabel)
//        newLabel.backgroundColor = UIColor.purple
//        newLabel.text = "NEW"
//        newLabel.textColor = UIColor.white
//        newLabel.font = UIFont.systemFont(ofSize: 10)
//        newLabel.snp.makeConstraints { (make) in
//            make.bottom.equalTo(leftImage.snp.centerY).offset(-5)
//            make.left.equalTo(leftImage.snp.right).offset(10)
//        }
//        
//        subDescLabel.snp.makeConstraints { (make) in
//            make.left.equalTo(newLabel.snp.right).offset(3)
//            make.centerY.equalTo(newLabel.snp.centerY)
//        }
//        
//        
//        titleLabel.snp.makeConstraints { (make) in
//            make.left.equalTo(newLabel.snp.right)
//            make.bottom.equalTo(newLabel.snp.top).offset(-5)
//        }
//        
//        infoLable.snp.makeConstraints { (make) in
//            
//            make.left.equalTo(newLabel.snp.right)
//            make.top.equalTo(leftImage.snp.centerY).offset(5)
//        }
//        
//        infoButton.snp.makeConstraints { (make) in
//            make.left.equalTo(newLabel.snp.right)
//            make.top.equalTo(infoLable.snp.bottom).offset(10)
//            make.size.equalTo(CGSize(width: 80, height: 30))
//        }
        
    }
    
}
