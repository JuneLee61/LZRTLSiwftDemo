//
//  MineVC.swift
//  LZRTLSiwftDemo
//
//  Created by 李君 on 2020/11/16.
//

import UIKit
import SnapKit

class MineVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        var arrowImage = UIImage.init(named: "common_leftArrow")
        let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        arrowImage = arrowImage?.rtl_imageFlippenForRightToLeftLayoutDirection(isRight: delegate.isRTL)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: arrowImage, style: .plain, target: self, action: #selector(clickArrowBtn))

        let header = HeaderView()
        self.view.addSubview(header)
        header.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(64)
            make.height.equalTo(76)
        }
        
        let tabView = UITableView.init(frame: .zero, style: .grouped)
        tabView.backgroundColor = .white
        tabView.delegate = self
        tabView.dataSource = self
        tabView.separatorStyle = .none
        tabView.tableHeaderView = createHeaderView()
        self.view.addSubview(tabView)
        tabView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(header.snp.bottom)
        }
        
    }
    
    func createHeaderView() -> ProfileSegView {
        
        var items = [ProfileSegItem]()
        items.append(ProfileSegItem.init(type: .FAQ, title: "FAQ1", iconName: "faq_icon"))
        items.append(ProfileSegItem.init(type: .Feedback, title: "反馈2", iconName: "feekbook_icon"))
        items.append(ProfileSegItem.init(type: .AddUser, title: "添加成员3", iconName: "add_user_icon"))
        items.append(ProfileSegItem.init(type: .Setting, title: "设置4", iconName: "set_icon"))

        let segView = ProfileSegView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 84), segItems: items)
        return segView
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProfileCell.init(style: .default, reuseIdentifier: "ProfileCell")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("点击删除")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func clickArrowBtn() {
        
    }


}
