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
    
    class func screensHotView(_ view : UIView) -> UIImage?{
        
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        
        if let ctx = UIGraphicsGetCurrentContext(){
            view.layer.render(in: ctx)
            view.layer.backgroundColor = UIColor.white.cgColor

            let image = UIGraphicsGetImageFromCurrentImageContext();// 生成新图片
            UIGraphicsEndImageContext();// 关闭上下文
            return image
        }
        return nil
    }
    
}
