//
//  UIImage+Extension.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/3.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import Foundation
import Kingfisher
extension UIImage {

    
    class func setNavItemWithImageName(imageName:String) -> UIImage {
        
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        
        return image!
    }
    
    
}
