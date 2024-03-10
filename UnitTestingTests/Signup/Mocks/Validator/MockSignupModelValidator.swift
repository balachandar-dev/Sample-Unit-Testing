//
//  MockSignupModelValidator.swift
//  UnitTestingTests
//
//  Created by Janani on 6/3/24.
//

import Foundation
@testable import UnitTesting

class MockSignupModelValidator : SignUpFormModelValidatorProtocol {
    var isFirstNameValidated : Bool = false
    var isLastNameValidated : Bool = false
    var isEmailValidated : Bool = false
    var isPasswordValidated : Bool = false
    var isPasswordMatchValidated : Bool = false

    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, confirmPassword: String) -> Bool {
        isPasswordMatchValidated = true
        return isPasswordMatchValidated
    }
    
}
