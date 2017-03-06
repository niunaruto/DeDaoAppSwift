//
//  AppDelegate.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/1.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setRootController()

        return true
    }
   
    

}

extension AppDelegate {
    func setRootController(){
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = DDTabBarViewController()
        window?.makeKeyAndVisible()
    }
    
}

