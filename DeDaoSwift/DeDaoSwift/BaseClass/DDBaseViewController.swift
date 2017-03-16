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
        
        let leftSeacrch = UIButton.init(type: .custom)
        leftSeacrch.frame = CGRect(x: -15, y: 0, width: 44, height: 44)
        leftSeacrch.setImage(UIImage(named: "new_main_navbar_search_black-1"), for: .normal)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        leftView.addSubview(leftSeacrch)
        let LeftBar = UIBarButtonItem(customView: leftView)
        self.navigationItem.leftBarButtonItem =  LeftBar
        
    }
    
    /// 设置右侧navItem 默认一个play
    func setRightNavItems(_ itemsImageName:Array<String>? = nil) {
        var rightBarButtonItems = Array<UIBarButtonItem>()
        
        if let imageArray =  itemsImageName{
            
            for i in 0...(imageArray.count - 1) {
                let videoItem = UIBarButtonItem(image: UIImage.setNavItemWithImageName(imageName: imageArray[i]), style: .plain, target: self, action: #selector(clickVideoPlayItem))
                rightBarButtonItems.append(videoItem)
            }
        }
        
        let videoItem = UIBarButtonItem(image: UIImage.setNavItemWithImageName(imageName: "navbar_playing_icon_anim_1"), style: .plain, target: self, action: #selector(clickVideoPlayItem))
        rightBarButtonItems.insert(videoItem, at: 0)
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
