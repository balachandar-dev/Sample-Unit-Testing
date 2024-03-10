//
//  SignupPresenter.swift
//  UnitTesting
//
//  Created by Janani on 5/3/24.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator : SignUpFormModelValidatorProtocol
    
    init(formModelValidator : SignUpFormModelValidatorProtocol) {
        self.formModelValidator = formModelValidator
    }
    
    func processUserSignup(formModel : SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, confirmPassword: formModel.repeatPassword) {
            return
        }
    }
}
