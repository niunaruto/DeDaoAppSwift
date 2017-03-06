//
//  DDBaseViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/3.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setLeftSearchNavItem()
        setRightNavItems()
    }
    
   

    
}

// MARK: 设置navItem
extension DDBaseViewController {
    func setLeftSearchNavItem() {
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.setNavItemWithImageName(imageName: "new_main_navbar_search_black-1"), style: .plain, target: self, action: #selector(clickLeftSearchNavItem))
    }
    func setRightNavItems() {
        
        let videoItem = UIBarButtonItem(image: UIImage.setNavItemWithImageName(imageName: "golden_card_playing_btn"), style: .plain, target: self, action: #selector(clickVideoPlayItem))
        
        self.navigationItem.rightBarButtonItems = [videoItem]
    }
}
// MARK: 处理navItem点击事件

extension DDBaseViewController {
    func clickVideoPlayItem() {
        
    }
    func clickLeftSearchNavItem() {
        
    }
}
