//
//  MockSignupViewDelegate.swift
//  UnitTestingTests
//
//  Created by Janani on 14/3/24.
//

import Foundation
import XCTest
@testable import UnitTesting

class MockSignupViewDelegate : SignUpViewDelegateProtocol {
    var expectation : XCTestExpectation?
    var successfullSignupCounter = 0
    var errorHandlerMethodCalled = 0
    var signupError : SignupError?
    
    func successfullSignup() {
        successfullSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        signupError = error
        errorHandlerMethodCalled += 1
        expectation?.fulfill()
    }
    
    
    
    
}
