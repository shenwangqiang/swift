//
//  WBBaseViewController.swift
//  weibo
//
//  Created by 沈王强 on 2018/1/5.
//  Copyright © 2018年 沈王强. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       
        
    }
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.cz_random()

        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
