//
//  AppDelegate.swift
//  DeDaoSwift
//
//  Created by niuting on 2017/3/1.
//  Copyright © 2017年 niuNaruto. All rights reserved.
//

import UIKit
import GDPerformanceView_Swift
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
            GDPerformanceMonitor.sharedInstance.startMonitoring()
            GDPerformanceMonitor.sharedInstance.configure(configuration: { (textLabel) in
                textLabel?.backgroundColor = .black
                textLabel?.textColor = .white
                textLabel?.layer.borderColor = UIColor.black.cgColor
            })
        #endif

        setRootController()

        return true
    }
   
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        #if DEBUG
            GDPerformanceMonitor.sharedInstance.stopMonitoring()
        #endif
        
    }

}

extension AppDelegate {
    func setRootController(){
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = DDTabBarViewController()
        window?.makeKeyAndVisible()
    }
    
}

