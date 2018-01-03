//
//  DetailTableViewController.swift
//  contact
//
//  Created by 沈王强 on 2018/1/3.
//  Copyright © 2018年 沈王强. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    var person:Person?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    
    var completionCallBack: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if person != nil {
            nameText.text = person?.name
            phoneText.text = person?.phone
            titleText.text = person?.title
        }
    }

    @IBAction func savePerson(_ sender: Any) {
        person?.name = nameText.text
        person?.phone = phoneText.text
        person?.title = titleText.text
        completionCallBack?()
        _ = navigationController?.popViewController(animated: true)
    }
}
