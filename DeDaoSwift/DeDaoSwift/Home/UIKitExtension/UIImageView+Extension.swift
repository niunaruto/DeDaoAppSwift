//
//  UIImageView+Extension.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/6.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//


import Foundation
import Kingfisher

extension UIImageView {

    func setImageWith(url:String,placeholder:UIImage? = nil) {

        
        self.kf.setImage(with: URL(string: url), placeholder: placeholder)
        
    }
}
