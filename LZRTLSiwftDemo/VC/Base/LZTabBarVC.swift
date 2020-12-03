//
//  LZTabBarVC.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/16.
//

import UIKit

class LZTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createBarItem(vc: MainVC(), title: "主页", image: "", selectImage: "")
        self.createBarItem(vc: ChartVC(), title: "图表", image: "", selectImage: "")
        self.createBarItem(vc: MineVC(), title: "我的", image: "", selectImage: "")
    }
    
    func createBarItem(vc: UIViewController, title: String, image: String, selectImage: String) {
        let nav = LZNavVC.init(rootViewController: vc)
        nav.tabBarItem.image = UIImage.init(named: image)
        nav.tabBarItem.selectedImage = UIImage.init(named: selectImage)
        nav.tabBarItem.title = title
        self.addChild(nav)
    }
    

}
