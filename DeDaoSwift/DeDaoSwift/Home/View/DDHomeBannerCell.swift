//
//  DDHomeBannerCell.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/7.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDHomeBannerCell: DDBaseTableViewCell {

    
    var imageArray : Array<String> = []{
        didSet{
            banner.imageUrlArray =  imageArray
        }
    }
    
    
    lazy var banner: NNBannerScrollView = {
         let banner = NNBannerScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 140), nil, self, nil)
        return banner
    }()
    
    
    override func setUI() {
       contentView.addSubview(banner)
    }
    
    override func setLayout() {
        banner.snp .makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(140)
        }
    }

    
    
}


extension DDHomeBannerCell : NNBannerScrollViewDelegate{
    func bannerScrollViewDidSelectItemAt(index: NSInteger) {
        
    }
}
