//
//  DDHomeHotAndGustCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/15.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeHotAndGustCell: DDBaseTableViewCell {
//dataMiningAduioOrBook
    override func setCellsViewModel(_ model: Any?) {
        if let modelT = model as? DDHomeSliderModel {
            guard modelT.list?.count ?? 0 >= 3  && LabelArray.count >= 3 && imageArray.count >= 3 else {
                return
            }
            if let list =  modelT.list{
                
                for i in 0...2 {
                    LabelArray[i].text = list[i].m_title
                    let img : UIImageView = imageArray[i]
                    img.kf.setImage(with: URL(string: list[i].m_img))
                }
                
            }
           
            
        }
    }
    
    lazy var imageArray = Array<UIImageView>()
    lazy var LabelArray = Array<UILabel>()
    
    
    override func setUI() {
        let backView = UIView()
        contentView.addSubview(backView)
        backView.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(160)
        })
        
        
        for i in 0...2 {
            let itemButton = UIButton()
            contentView.addSubview(itemButton)
            let staY : CGFloat = 10
            let itemH : CGFloat = 140
            let itemW = UIView.screenWidth / 3.0
            itemButton.frame = CGRect(x: CGFloat(i) * itemW , y: staY, width: itemW, height: itemH)
            let infoImageViewW : CGFloat  = 100
            let infoImageViewGap : CGFloat = 10
            
            let infoImageView = UIImageView(frame: CGRect(x: 10, y: 0, width: itemW - infoImageViewGap - infoImageViewGap, height: infoImageViewW))
            itemButton.addSubview(infoImageView)
            
            let titleLabelY = infoImageView.frame.origin.y + infoImageView.frame.size.height + 5.0
            
            let titleLabel = UILabel(frame: CGRect(x: infoImageView.frame.origin.x, y: titleLabelY, width: infoImageView.frame.size.width, height: itemButton.frame.size.height - titleLabelY))
            titleLabel.textColor = UIColor.init("#999999")
            titleLabel.numberOfLines = 2
            titleLabel.font = UIFont.systemFont(ofSize: 10)
            
            itemButton.addSubview(titleLabel)
            imageArray.append(infoImageView)
            LabelArray.append(titleLabel)
            backView.addSubview(itemButton)

        }
        
    }
}
