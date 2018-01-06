//
//  WBMainViewController.swift
//  weibo
//
//  Created by 沈王强 on 2018/1/5.
//  Copyright © 2018年 沈王强. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let array=[
            ["clsName":"WBHomeViewController","title":"首页","image":"home"],
            ["clsName":"WBMessageViewController","title":"消息","image":"message_center"],
            ["clsName":"WBDiscoverViewController","title":"发现","image":"discover"],
            ["clsName":"WBProfileViewController","title":"我","image":"profile"],
        ]
        
        var map = [UIViewController]()
        for dict in array {
            map.append(controller(dict: dict))
        }
    
        viewControllers = map
    }
}

    extension WBMainViewController {
        
        private func setupView(){
            
        }
        
        private func controller(dict:[String:String]) -> UIViewController{
            guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["image"],
            let cls  = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            else {
                    return UIViewController()
            }
     
        
        let vc = cls.init()
        vc.title = title
            vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
            vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        let nav = WBNavigationController(rootViewController:vc)
        return nav
        }
    }
