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

    func successfullSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        //
    }
    
    
    
    
}
