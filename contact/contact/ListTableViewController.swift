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
               array.append(per)
            }
            
            DispatchQueue.main.async (execute: {
                // Closure use of non-escaping parameter 'completion' may allow it to escape
                completion(array)
            })
        }
    }

    // MARK: - 数据源方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "listToDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailTableViewController
        if let indexPath = sender as? IndexPath{
            vc.person = personList[indexPath.row]
            
            vc.completionCallBack = {
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
  
}
