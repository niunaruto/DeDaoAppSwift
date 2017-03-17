//
//  UIBarButtonItem+Extension.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/17.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import Foundation

extension UIBarButtonItem {
    class func creatBarButtonItem(_ imageString:String,_ itemsCount : Int? = 1) -> UIBarButtonItem {
        
        
        let leftSeacrch = UIButton.init(type: .custom)
        
        leftSeacrch.frame = CGRect(x: -15 * CGFloat(itemsCount!), y: 0, width: 44, height: 44)
        leftSeacrch.setImage(UIImage(named: imageString), for: .normal)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        leftView.addSubview(leftSeacrch)
        return UIBarButtonItem(customView: leftView)
    }
}
