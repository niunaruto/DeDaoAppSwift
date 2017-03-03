//
//  DDTabBarViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/2.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import UIKit

class CYLBaseNavigationController: UINavigationController {
    
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count>0 {
            
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}


class DDTabBarViewController: CYLTabBarController,
UITabBarControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
    }
    
    func setupViewController() {
        
        
        let tabbarAttributes = [
            [CYLTabBarItemImage:"pad_tabbar_index_1",
             CYLTabBarItemSelectedImage:"pad_tabbar_index_1_light"],
            [CYLTabBarItemImage:"pad_tabbar_index_2",
             CYLTabBarItemSelectedImage:"pad_tabbar_index_2_light"],
            [CYLTabBarItemImage:"pad_tabbar_icon_hear",
             CYLTabBarItemSelectedImage:"pad_tabbar_icon_hear_light"],
            [CYLTabBarItemImage:"pad_tabbar_index_3",
             CYLTabBarItemSelectedImage:"pad_tabbar_index_3_light"],
            [CYLTabBarItemImage:"pad_tabbar_index_4",
             CYLTabBarItemSelectedImage:"pad_tabbar_index_4_light"]];

        
        tabBarItemsAttributes = tabbarAttributes
        imageInsets = UIEdgeInsetsMake(8, 0, -8, 0)
        let home = CYLBaseNavigationController(rootViewController: DDTableViewController())
        
        
        let mine = CYLBaseNavigationController(rootViewController: DDTableViewController())
        
        let chat = CYLBaseNavigationController(rootViewController: DDTableViewController())
        
        let bbs = CYLBaseNavigationController(rootViewController: DDTableViewController())
        
        let seven = CYLBaseNavigationController(rootViewController: DDTableViewController())
        
        
        
        
        viewControllers = [
            home,
            mine,
            chat,
            bbs,
            seven
        ]
    }
}

