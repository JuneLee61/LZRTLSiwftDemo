//
//  ProfileSegView.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/17.
//

import UIKit

class ProfileSegItem: NSObject {
    var segType: ProfileSegType
    var title: String
    var iconName: String
    
    init(type: ProfileSegType, title: String, iconName: String) {
        self.segType = type
        self.title = title
        self.iconName = iconName
    }
}

class ProfileSegView: UIView {

    init(frame: CGRect, segItems: [ProfileSegItem]) {
        super.init(frame: frame)
        
        var lastControl = ProfileControl.init(frame: CGRect.zero, type: .FAQ, iconName: "", title: "")
        for i in 0..<segItems.count {
            let item = segItems[i]
            let control = ProfileControl.init(frame: CGRect.zero, type: item.segType, iconName: item.iconName, title: item.title)
            self.addSubview(control)
            control.snp.makeConstraints { (make) in
                make.top.equalTo(self)
                make.bottom.equalTo(self).offset(-11)
                if i == 0 {
                    make.leading.equalTo(self)
                } else if i == segItems.count - 1 {
                    make.width.equalTo(lastControl)
                    make.trailing.equalTo(self)
                    make.leading.equalTo(lastControl.snp.trailing)
                } else {
                    make.leading.equalTo(lastControl.snp.trailing)
                    make.width.equalTo(lastControl)
                }
            }
            lastControl = control
        }

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
