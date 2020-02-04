//
//  ViewController.swift
//  Contact
//
//  Created by SOWA KILLIAN on 04/02/2020.
//  Copyright © 2020 SOWA KILLIAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var datasContact:[Contact] = []

    @IBOutlet weak var contactList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactList.delegate = self
        contactList.dataSource = self
        
        contactList.reloadData()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasContact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let currentValue = datasContact[indexPath.row]
        cell.textLabel?.text = currentValue.display()
        
              return cell
    }
    
}

extension ViewController:UITableViewDelegate {
    func tableView(_ ResultList: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ ResultList: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
