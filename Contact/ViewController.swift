//
//  ViewController.swift
//  Contact
//
//  Created by SOWA KILLIAN on 04/02/2020.
//  Copyright © 2020 SOWA KILLIAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contactList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactList.delegate = self
        contactList.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contactList.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactManager.instance.contact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let currentValue = ContactManager.instance.contact[indexPath.row]
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
