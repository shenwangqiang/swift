//
//  WBHomeViewController.swift
//  weibo
//
//  Created by 沈王强 on 2018/1/5.
//  Copyright © 2018年 沈王强. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class WBHomeViewController: WBBaseViewController {
    private lazy var statusList = [String]()
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
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func loadData(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
        for i in 0..<20 {
            
            if self.isPullup {
                self.statusList.append("上拉 \(i)")
            } else {
                self.statusList.insert(i.description, at: 0)
            }
        }
            self.refreshControl?.endRefreshing()
            
            self.isPullup = false
            self.tableView?.reloadData()
        })
    }
}

extension WBHomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId,for:indexPath)
        cell.textLabel?.text  = statusList[indexPath.row]
        return cell;
    }
}
