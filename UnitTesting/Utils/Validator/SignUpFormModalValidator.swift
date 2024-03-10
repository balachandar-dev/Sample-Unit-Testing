//
//  SignUpFormModalValidator.swift
//  UnitTesting
//
//  Created by Janani on 4/6/23.
//

import Foundation

class SignUpFormModalValidator : SignUpFormModelValidatorProtocol{
    
    func isFirstNameValid(firstName : String) -> Bool {
        var returnValue = true
        if firstName.count < SignupConstants.firstNameMinimumLength || firstName.count > SignupConstants.firstNameMaximumLenght {
            returnValue = false
        }
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isValidEmailFormat(email: String) -> Bool {
       return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = true
        
        if password.count < SignupConstants.passwordMinLength ||
        password.count > SignupConstants.passwordMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func doPasswordsMatch(password : String, confirmPassword : String) -> Bool {
        var returnValue = true
        if password != confirmPassword {
            returnValue = false
        }
        
        return returnValue
    }
}
