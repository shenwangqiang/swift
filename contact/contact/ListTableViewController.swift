//
//  ListTableViewController.swift
//  contact
//
//  Created by 沈王强 on 2018/1/3.
//  Copyright © 2018年 沈王强. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDate { (list) in
            self.personList += list
            
            self.tableView.reloadData()
        }
    }
    
    func loadDate(completion: @escaping ( _ list: [Person]) -> ()) -> (){
        print("数据加载中")
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            var array = [Person]()
            for i in 0..<20{
                let per = Person()
                per.name = "李四 \(i)"
                per.phone = "18601"+String(format:"%06d",arc4random_uniform(1000000))
                per.title = "boss"
                print("\(per.phone) \(per.name) \(per.title)")
                array.append(per)
            }
            
            DispatchQueue.main.async (execute: {
                // Closure use of non-escaping parameter 'completion' may allow it to escape
                completion(array)
            })
        }
    }

  
}
