//
//  ProfileControl.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/17.
//

import UIKit

enum ProfileSegType {
    case FAQ
    case Feedback
    case AddUser
    case Setting
}

class ProfileControl: UIView {

    init(frame: CGRect, type: ProfileSegType, iconName: String, title: String) {
        super.init(frame: frame)
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(self).offset(-14.5)
        }
        
        let iconView = UIImageView.init(image: UIImage.init(named: iconName))
        self.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(titleLabel.snp.top).offset(-7.5)
            make.width.equalTo(CGFloat(iconView.image?.size.width ?? 0))
            make.height.equalTo(CGFloat(iconView.image?.size.height ?? 0))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
