//
//  SignUpFormModalValidator.swift
//  UnitTesting
//
//  Created by Janani on 4/6/23.
//

import Foundation

class SignUpFormModalValidator{
    
    func isFirstNameValid(firstName : String) -> Bool {
        var returnValue = true
        if firstName.isEmpty {
            returnValue = false
        }
        return returnValue
    }
}
