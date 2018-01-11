//
//  WBBaseViewController.swift
//  weibo
//
//  Created by 沈王强 on 2018/1/5.
//  Copyright © 2018年 沈王强. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController{
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?
    
    var isPullup = false
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       loadData()
        
    }
    @objc func loadData() {
        refreshControl?.endRefreshing()
    }
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.cz_random()
        automaticallyAdjustsScrollViewInsets = false
        setNavigationBar()
        setTableView()
    }
    
    private func setNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        
    }
    
    private func setTableView(){
        tableView = UITableView(frame: view.bounds,style: .plain)
        
        view.insertSubview(tableView!,belowSubview: navigationBar)
        
        tableView?.dataSource = self
        tableView?.delegate =  self
        
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height-20, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
//    override var prefersStatusBarHidden: Bool{
//        return true
//    }
}

extension WBBaseViewController :UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        if row < 0 || section < 0 {
            return
        }
        let count = tableView.numberOfRows(inSection: section)
        if row == count - 1  && !isPullup {
            isPullup = true
            loadData()
        }
    }
    
    
    
    
    
    
    
}
