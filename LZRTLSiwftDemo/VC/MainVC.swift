//
//  MainVC.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/16.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        UILabel.initializeMethod()

        
        let test1 = UILabel.init()
        test1.text = "test1"
        test1.textAlignment = .left
        test1.frame = CGRect(x: 0, y: 100, width: 100, height: 50)
        test1.backgroundColor = .purple
        self.view.addSubview(test1)
        
        let test2 = UILabel.init()
        test2.text = "test2"
        test2.textAlignment = .left
        test2.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        test2.backgroundColor = .blue
        self.view.addSubview(test2)
        
        let test3 = UILabel.init()
        test3.text = "test3"
        test3.textAlignment = .left
        test3.frame = CGRect(x: 200, y: 100, width: 100, height: 50)
        test3.backgroundColor = .green
        self.view.addSubview(test3)
        
        test1.resetFrameToFitRTL()
        test2.resetFrameToFitRTL()
        test3.resetFrameToFitRTL()
        

    }

}
