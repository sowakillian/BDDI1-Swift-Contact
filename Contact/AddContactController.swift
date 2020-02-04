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
    
    var contact = Contact(firstName: "", lastName: "", phoneNumber: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        phoneNumberField.delegate = self

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
        
        self.performSegue(withIdentifier: "toViewController", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewController" {
            if let dest = segue.destination as? ViewController {
                dest.datasContact.append(self.contact)
            }
        }
    }

}

extension AddContactController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if let firstName = firstNameField.text {
            print(firstName)
            self.contact.firstName = firstName
        }
        
        if let lastName = lastNameField.text {
            self.contact.lastName = lastName
        }
        
        if let phoneNumber = phoneNumberField.text {
            self.contact.phoneNumber = phoneNumber
        }
        
        return true
    }
}
