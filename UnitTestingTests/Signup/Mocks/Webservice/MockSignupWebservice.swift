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

    func signUp(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupFormResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true
        
        let signUpResponseModel = SignupFormResponseModel(status: "OK")
        completionHandler(signUpResponseModel, nil)
    }
    
}
