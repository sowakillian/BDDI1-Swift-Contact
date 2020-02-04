//
//  Contact.swift
//  Contact
//
//  Created by SOWA KILLIAN on 04/02/2020.
//  Copyright © 2020 SOWA KILLIAN. All rights reserved.
//

import Foundation

struct Contact {
    var firstName: String
    var lastName: String
    var phoneNumber: String
    
    func display() -> String {
        return "\(self.firstName) \(self.lastName) \(self.phoneNumber)"
    }
}
