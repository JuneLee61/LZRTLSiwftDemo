//
//  AppDelegate.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    public var isRTL: Bool = true
    public var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.isRTL = true
        if self.isRTL {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UISearchBar.appearance().semanticContentAttribute = .forceRightToLeft
            UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
        }
        
        let tabBar = LZTabBarVC.init()
        self.window?.rootViewController = tabBar
        self.window?.makeKeyAndVisible()
        return true
    }

}

