//
//  WBDemoViewController.swift
//  weibo
//
//  Created by 沈王强 on 2018/1/9.
//  Copyright © 2018年 沈王强. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc private func goNext() {
        navigationController?.pushViewController(WBDemoViewController(), animated: true)
    }

    override func setupUI() {
        super.setupUI()
        navItem.title = "第 \(navigationController?.childViewControllers.count ?? 0) 个"

        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", fontSize: 16, target: self, action: #selector(goNext), isBack: false)
    }

}

