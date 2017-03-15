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
            guard modelT.list?.count ?? 0 >= 3  && contentsArray.count >= 3 else {
                return
            }
            if let list =  modelT.list{
                
                for i in 0...2 {
                    contentsArray[i].titleLabel.text = list[i].m_title
                    let img : UIImageView = contentsArray[i].infoImageView
                    img.kf.setImage(with: URL(string: list[i].m_img))
                }
                
            }
           
            
        }
    }
    
    lazy var contentsArray = Array<DDHomeHotAndGustView>()
    
    
    override func setUI() {
        let backView = UIView()
        let backViewH : CGFloat = 200
        
        contentView.addSubview(backView)
        backView.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(backViewH)
        })
        
        
        for i in 0...2 {
            let itemView = DDHomeHotAndGustView()
            
            backView.addSubview(itemView)
            let itemsW = UIView.screenWidth / CGFloat(3)
            
            itemView.frame = CGRect(x: CGFloat(i) * itemsW, y: 0, width: itemsW, height: backViewH)
            
            contentsArray.append(itemView)
        }
        
    }
}


class DDHomeHotAndGustView: UIView {
    

    
    
    lazy var infoImageView : UIImageView = {
        let infoImageView = UIImageView()
        infoImageView.contentMode = .scaleAspectFill
        infoImageView.clipsToBounds = true
        return infoImageView
    }()
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.init("#666666")
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.systemFont(ofSize: 11)
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(clickImageView))
        addGestureRecognizer(tap)
    }
    func clickImageView() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        addSubview(infoImageView)
        addSubview(titleLabel)
        infoImageView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.height.equalTo(140)
            make.right.equalToSuperview().offset(-10)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(infoImageView)
            make.right.equalTo(infoImageView)
            make.top.equalTo(infoImageView.snp.bottom).offset(8)
        }
    }
}
