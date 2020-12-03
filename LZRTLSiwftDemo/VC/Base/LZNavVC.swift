//
//  LZNavVC.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/16.
//

import UIKit
import os_object

private let onceToken = "Method Swizzling"

class LZNavVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        if delegate.isRTL {
            self.navigationBar.semanticContentAttribute = .forceRightToLeft
            self.view.semanticContentAttribute = .forceRightToLeft
        }
    }
}
