//
//  MockSignupWebservice.swift
//  UnitTestingTests
//
//  Created by Janani on 11/3/24.
//

import Foundation
@testable import UnitTesting

class MockSignupWebservice : SignupWebserviceProtocol {
    
    var isSignupMethodCalled : Bool = false
    var shouldReturnError : Bool = false
    
    func signUp(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupFormResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Error occured"))
        }
        else {
            let signUpResponseModel = SignupFormResponseModel(status: "OK")
            completionHandler(signUpResponseModel, nil)
        }
    }
    
}
