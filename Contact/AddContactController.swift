//
//  AddContactController.swift
//  Contact
//
//  Created by SOWA KILLIAN on 04/02/2020.
//  Copyright © 2020 SOWA KILLIAN. All rights reserved.
//

import UIKit

class AddContactController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getFieldValues() -> (firstName:String, lastName:String, phoneNumber:String)? {
        if let firstName = firstNameField.text,
            let lastName = lastNameField.text,
                let phoneNumber = phoneNumberField.text {
                    return (firstName, lastName, phoneNumber)
            }
        return nil
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        if let fields = getFieldValues() {
            let contact = Contact(firstName: fields.firstName, lastName: fields.lastName, phoneNumber: fields.phoneNumber)
            
            ContactManager.instance.contact.append(contact)
            
            self.navigationController?.popToRootViewController(animated: true)
        }
    }

}

