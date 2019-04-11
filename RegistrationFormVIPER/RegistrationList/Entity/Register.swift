//
//  Register.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 10/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

struct Register : Codable {
    var name : String
    var email : String
    var password : String
    var gender : String
    var phone : String
    
    init(name: String, email: String, password: String, gender: String, phone: String) {
        self.name = name
        self.email = email
        self.password = password
        self.gender = gender
        self.phone = phone
    }
}
