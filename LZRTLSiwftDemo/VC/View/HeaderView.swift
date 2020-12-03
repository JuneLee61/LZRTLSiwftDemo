//
//  HeaderView.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/17.
//

import UIKit
import SnapKit

class HeaderView: UIView {

    let iconImage = UIImageView()
    let nameLabel = UILabel()
    let arrwoImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    func createUI() {
        self.backgroundColor = .purple
        
        let iconWidth = 65.0
        iconImage.image = UIImage.init(named: "Profile_headPortrait_female")
        R.
        iconImage.layer.cornerRadius = CGFloat(iconWidth / 2.0)
        self.addSubview(iconImage)
        iconImage.snp.makeConstraints { (make) in
            make.leading.equalTo(35)
            make.top.equalTo(self)
            make.width.height.equalTo(iconWidth)
        }
        
        nameLabel.textColor = .white
        nameLabel.text = "测试服"
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(iconImage.snp.trailing).offset(15)
            make.centerY.equalTo(iconImage)
            make.trailing.equalTo(self.snp.trailing).offset(-100)
        }
        
        var image = UIImage.init(named: "common_rightArrow")
        let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        image = image?.rtl_imageFlippenForRightToLeftLayoutDirection(isRight: delegate.isRTL)
        arrwoImage.image = image
        arrwoImage.contentMode = .scaleAspectFit
        self.addSubview(arrwoImage)
        arrwoImage.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.centerY.equalTo(iconImage)
            make.width.height.equalTo(15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
