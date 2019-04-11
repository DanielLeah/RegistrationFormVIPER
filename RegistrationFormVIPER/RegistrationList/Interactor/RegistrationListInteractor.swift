//
//  RegistrationListInteractor.swift
//  RegistrationFormVIPER
//
//  Created by David Daniel Leah (BFS EUROPE) on 10/04/2019.
//  Copyright © 2019 David Daniel Leah (BFS EUROPE). All rights reserved.
//

import UIKit

class RegistrationListInteractor: RegistrationListInputInteractorProtocol {
    weak var presenter : RegistrationListOutputInteractorProtocol?
    
    func evaluate(inputs: Register) {
        presenter?.didEvaluateWithResult(message: evaluate(inputs: inputs).0, img: evaluate(inputs: inputs).1, title: evaluate(inputs: inputs).2)
    }
    
    //Validation
    private func evaluate(inputs: Register) -> (String , String, String) {
        var isValid : [String : String] = [:]
        //name :special case: Multiple names?
        if inputs.name.contains(" ") {
            let names = inputs.name.split(separator: " ")
            for name in names{
                let nameResult = Validation.shared.validate(values: (type: ValidationType.stringWithFirstLetterCaps, inputValue: String(name)))
                switch nameResult {
                case .success:
                    break
                case .failure(_, let message):
                    isValid["name"] = message.localized()
                }
            }
        }else{
            let nameResult = Validation.shared.validate(values: (type: ValidationType.stringWithFirstLetterCaps, inputValue: inputs.name))
            switch nameResult {
            case .success:
                break
            case .failure(_, let message):
                isValid["name"] = message.localized()
            }
        }
        
        
        //email
        var result = Validation.shared.validate(values: (type: ValidationType.email, inputValue: inputs.email))
        switch result {
        case .success:
            isValid["email"] = "Success"
        case .failure(_, let message):
            isValid["email"] = message.localized()
        }
        //password
        result = Validation.shared.validate(values: (type: ValidationType.password, inputValue: inputs.password))
        switch result {
        case .success:
            isValid["password"] = "Success"
        case .failure(_, let message):
            isValid["password"] = message.localized()
        }
        //phone
        result = Validation.shared.validate(values: (type: ValidationType.phoneNo, inputValue: inputs.phone))
        switch result {
        case .success:
            isValid["phone"] = "Success"
        case .failure(_, let message):
            isValid["phone"] = message.localized()
        }
        
        var isValidate = true
        var stringTitle = ""
        for key in isValid.keys {
            if (isValid[key] != "Success"){
                isValidate = false
                stringTitle += isValid[key]!
                stringTitle += "\n"
            }
        }
        //yes : do Success notification and show next view
        if (isValidate){
            stringTitle = "You are registered"
            saveToDefaults(user: inputs)
            
            return (message: stringTitle, img: "success", superTitle: "Welcome")
        }else {
            return (message: stringTitle, img: "error", superTitle: "Please review: " )
        }
        
    }
    
    func saveToDefaults(user: Register){
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: "user")
        }

    }
    
}
