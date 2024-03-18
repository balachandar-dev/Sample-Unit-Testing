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
    private weak var viewDelegate : SignUpViewDelegateProtocol?
    
    init(formModelValidator : SignUpFormModelValidatorProtocol, webservice : SignupWebserviceProtocol, viewDelegate : SignUpViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.viewDelegate = viewDelegate
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
        
        webservice.signUp(withForm: signupRequestModel) { [weak self] (signUpResponseModel, error) in
            
            if let error = error {
                self?.viewDelegate?.errorHandler(error: error)
            }
            
            if let _ = signUpResponseModel {
                self?.viewDelegate?.successfullSignup()
                return
            }
            
        }
    }
}
