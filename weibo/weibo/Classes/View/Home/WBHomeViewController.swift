//
//  WBHomeViewController.swift
//  weibo
//
//  Created by 沈王强 on 2018/1/5.
//  Copyright © 2018年 沈王强. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc private func showFriends(){
        print(#function)
        let vc = WBDemoViewController()

        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setupUI() {
        super.setupUI()

        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFriends), isBack: false)
    }
}
