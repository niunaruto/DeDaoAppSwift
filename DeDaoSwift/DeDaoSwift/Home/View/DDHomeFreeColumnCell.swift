//
//  DDHomeFreeColumnCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/15.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeFreeColumnCell: DDBaseTableViewCell {

    lazy var contentimageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    override func setCellsViewModel(_ model: Any?) {
        if let modelT = model as? DDHomeVerseModel {
            contentimageView.kf.setImage(with: URL(string: modelT.image))
        }
    }
    
    override func setUI() {
        
        contentView.addSubview(contentimageView)
        contentimageView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.bottom.right.equalToSuperview().offset(-10)
            make.height.equalTo(140)
        }
        
    }

}
