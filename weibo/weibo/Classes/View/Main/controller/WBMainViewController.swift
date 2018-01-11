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
        let array  = [
            ["clsName":"WBHomeViewController" ,"title":"首页","image":"home",
             "visitorInfo": ["imageName": "","message": "关注一些人，回这里看看有什么惊喜"]],
            ["clsName":"WBMessageViewController","title":"消息","image":"message_center",
             "visitorInfo": ["imageName": "visitordiscover_image_message","message": "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知"]],
             ["clsName":"UIViewController"],
            ["clsName":"WBDiscoverViewController","title":"发现","image":"discover", "visitorInfo": ["imageName": "visitordiscover_image_message","message": "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过"]],
            ["clsName":"WBProfileViewController","title":"我","image":"profile", "visitorInfo": ["imageName": "visitordiscover_image_profile","message": "登录后，你的微博、相册、个人资料会显示在这里，暂时给别人看"]],
        ]
        
        var map = [UIViewController]()
        for dict in array {
            map.append(controller(dict: dict as [String : AnyObject]))
        }
    
        viewControllers = map
        
        setupComposeButton()
    }
    
    private lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
    @objc private func composeStatus(){
        
    }
}

    extension WBMainViewController {
        
        private func setupComposeButton(){
            tabBar.addSubview(composeButton)
            
            let count = CGFloat(childViewControllers.count)
            let w = tabBar.bounds.width / count - 1
            composeButton.frame  = tabBar.bounds.insetBy(dx: 2*w, dy: 0)
            
            composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        }
        
        private func setupView(){
            
        }
        
        private func controller(dict: [String:AnyObject]) -> UIViewController{
            guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["image"],
                let cls  = NSClassFromString(Bundle.main.namespace + "." + (clsName as! String)) as? WBBaseViewController.Type ,
            let visitorDict = dict["visitorInfo"] as? [String: String]
            else {
                    return UIViewController()
            }
     
        
        let vc = cls.init()
            vc.title = title as! String
            
            vc.visitorInfo  = visitorDict
            
            
            
            
            
            vc.tabBarItem.image = UIImage(named: "tabbar_" + (imageName as! String))
            vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + (imageName as! String) + "_selected")?.withRenderingMode(.alwaysOriginal)
            vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.orange], for: .highlighted)
        let nav = WBNavigationController(rootViewController:vc)
        return nav
        }
    }
