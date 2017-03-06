//
//  DDBaseViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/3.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDBaseViewController: UIViewController {

   var titleName : String? {
        didSet {
            navigationItem.title = titleName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        initializeData()
        initializeUI()
    }
    

    
}
extension DDBaseViewController {
    
    /// 初始化基本属性（非数据、非UI的东西，例如某些功能属性的设置...
    func initialize() {
        
    }
    
    /// 初始化UI（可以用来添加所有子控件）
    func initializeUI() {
        view.backgroundColor = UIColor.white
        
        setLeftSearchNavItem()
        setRightNavItems()

    }
    
    /// 初始化数据
    func initializeData() {
        
    }
}

// MARK: 设置navItem
extension DDBaseViewController {
    func setLeftSearchNavItem() {
        
        let leftSeacrch = UIButton()
        leftSeacrch.frame.size = CGSize(width: 44, height: 44)
        leftSeacrch.setImage(UIImage(named: "new_main_navbar_search_black-1"), for: .normal)
        let LeftBar = UIBarButtonItem(customView: leftSeacrch)
        LeftBar.width = -15
        
        
        self.navigationItem.leftBarButtonItem =  LeftBar
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
