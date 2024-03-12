//
//  SignupPresenter.swift
//  UnitTesting
//
//  Created by Janani on 5/3/24.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator : SignUpFormModelValidatorProtocol
    private var webservice : SignupWebserviceProtocol
    
    
    init(formModelValidator : SignUpFormModelValidatorProtocol, webservice : SignupWebserviceProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
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
        
        let signupRequestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webservice.signUp(withForm: signupRequestModel) { (signUpResponseModel, error) in
            //
        }
    }
}
