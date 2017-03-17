//
//  DDBaseViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/3.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

class DDBaseViewController: UIViewController {

    lazy var viewModel : DDBaseViewModel = {
        let viewModel = DDBaseViewModel()
        
        return viewModel
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initialize()
        navigationItem.title = viewModel.title
    }
    
    
}
extension DDBaseViewController {
    
    /// 初始化基本属性（非数据、非UI的东西，例如某些功能属性的设置...
    func initialize() {
        
    }
    
}

// MARK: 设置navItem
extension DDBaseViewController {
    func setLeftSearchNavItem() {
        
        self.navigationItem.leftBarButtonItem =  UIBarButtonItem.creatBarButtonItem("new_main_navbar_search_black-1")
        
    }
    
    /// 设置右侧navItem 默认一个play
    func setRightNavItems(_ itemsImageName:Array<String>? = nil) {
        var rightBarButtonItems = Array<UIBarButtonItem>()
        if var imageArray =  itemsImageName{
            imageArray.insert("navbar_playing_icon_anim_1", at: 0)
            for i in 0...(imageArray.count - 1) {
                rightBarButtonItems.append(UIBarButtonItem.creatBarButtonItem(imageArray[i],-(i+1)))
            }
        }else{
        rightBarButtonItems.append(UIBarButtonItem.creatBarButtonItem("navbar_playing_icon_anim_1",-1))
        }
        self.navigationItem.rightBarButtonItems = rightBarButtonItems
    }
}
// MARK: 处理navItem点击事件

extension DDBaseViewController {
    func clickVideoPlayItem() {
        
    }
    func clickLeftSearchNavItem() {
        
    }
}
