//
//  UIView+Extension.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/7.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import Foundation

extension UIView {
    /// The screen size
    class var size: CGSize {
        return UIScreen.main.bounds.size
    }
    
    /// The screen's width
    class var width: CGFloat {
        return UIView.size.width
    }
    
    /// The screen's height
    class var height: CGFloat {
        return UIView.size.height
    }
    
    
}
