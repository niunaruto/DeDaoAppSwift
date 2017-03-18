//
//  DDTabBarViewController.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/2.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

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
            [CYLTabBarItemImage:"tabbar_index_1",
             CYLTabBarItemTitle:"发现",
             CYLTabBarItemSelectedImage:"tabbar_index_select_1"],
            [CYLTabBarItemImage:"tabbar_index_2",
             CYLTabBarItemTitle:"今日学习",
             CYLTabBarItemSelectedImage:"tabbar_index_select_2"],
            [CYLTabBarItemImage:"tabbar_index_3",
             CYLTabBarItemTitle:"随时听",
             CYLTabBarItemSelectedImage:"tabbar_index_select_3"],
            [CYLTabBarItemImage:"tabbar_index_4",
             CYLTabBarItemTitle:"已购",
             CYLTabBarItemSelectedImage:"tabbar_index_select_4"],
            [CYLTabBarItemImage:"tabbar_index_5",
             CYLTabBarItemTitle:"我的",
             CYLTabBarItemSelectedImage:"tabbar_index_select_5"]];

        
        tabBarItemsAttributes = tabbarAttributes
        tabBar.tintColor = UIColor.orange
        let homeViewModel = DDHomeViewModel()
        let studyViewModel = DDStudyViewModel()
        
        
        
        let home = CYLBaseNavigationController(rootViewController: DDTableViewController(homeViewModel))
        
        
        let mine = CYLBaseNavigationController(rootViewController: DDStudyViewController(studyViewModel))
        
        let chat = CYLBaseNavigationController(rootViewController: DDTableViewController(homeViewModel))
        
        let bbs = CYLBaseNavigationController(rootViewController: DDTableViewController(homeViewModel))
        
        let seven = CYLBaseNavigationController(rootViewController: DDTableViewController(homeViewModel))
        
        
        
        viewControllers = [
            mine,
            home,
            chat,
            bbs,
            seven
        ]
    }
}

