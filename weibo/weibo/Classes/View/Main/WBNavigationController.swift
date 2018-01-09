//
//  WBNavigationController.swift
//  weibo
//
//  Created by 沈王强 on 2018/1/5.
//  Copyright © 2018年 沈王强. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        
        
    }
    
    @objc private func back() {
        popViewController(animated: true)
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        if let vc = viewController as? WBBaseViewController {
            var title = "返回"
            if childViewControllers.count == 1 {
                title = childViewControllers.first?.title ?? "返回"
            }
            vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(back),isBack: true)
            
            }
        }
        
        
        
        
        super.pushViewController(viewController, animated: animated)
    }

}
