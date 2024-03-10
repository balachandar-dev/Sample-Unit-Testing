//
//  SignUpFormModelValidatorProtocol.swift
//  UnitTesting
//
//  Created by Janani on 7/3/24.
//

import Foundation

protocol SignUpFormModelValidatorProtocol {
    func isFirstNameValid(firstName : String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isValidEmailFormat(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordsMatch(password : String, confirmPassword : String) -> Bool
}
