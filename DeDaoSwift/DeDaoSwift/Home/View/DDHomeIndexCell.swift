//
//  DDHomeIndexCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/13.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeIndexCell: DDBaseTableViewCell {

    lazy var backView  = UIView()
    
    
    override func setUI() {
        let titleArray = ["付费精选","电子书","每天听本书","系列","全部"]
        
        for i in 0 ..< titleArray.count {
            
            let button = UIButton()
            let w = UIScreen.main.bounds.size.width / CGFloat(titleArray.count)
            button.frame = CGRect(x: w * CGFloat(i), y: 0, width: w, height: 60)
            button.setTitle(titleArray[i], for: .normal)
            contentView.addSubview(button)
            button.setTitleColor(UIColor.init("#333333"), for: .normal)
            button.setImage(UIImage.init(named: "new_main_classification_\(i)"), for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
            button.setImagePosition(.top,spacing: 5)
            
            backView.addSubview(button)
            
        }
        contentView.addSubview(backView)
    }
    
    override func setLayout() {
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(60)
        }
    }
    
    

}
