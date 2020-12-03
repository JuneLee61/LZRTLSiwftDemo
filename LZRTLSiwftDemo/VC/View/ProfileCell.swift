//
//  ProfileCell.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/17.
//

import UIKit

class ProfileCell: UITableViewCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        let iconHeight = 45
        let iconView = UIImageView.init(image: UIImage.init(named: "Profile_headPortrait_female"))
        iconView.layer.cornerRadius = CGFloat(iconHeight) / 2.0
        self.contentView.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.leading.equalTo(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(45)
        }
        
        let nameLabel = UILabel()
        nameLabel.text = "name"
        self.contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(iconView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-100)
        }
        
        let weightLabel = UILabel()
        weightLabel.text = "45.80kg"
        weightLabel.textAlignment = .right
        self.contentView.addSubview(weightLabel)
        weightLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-15)
            make.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
