//
//  SignupFormModalValidatorTests.swift
//  UnitTestingTests
//
//  Created by Janani on 4/6/23.
//

import XCTest
@testable import UnitTesting


class SignupFormModalValidatorTests: XCTestCase {

    override func setUp() {
        //
    }
   
    override  func tearDown() {
        //
    }

    func testSignupModalValidatorForfirstName() {
        //Arrange
        let sut = SignUpFormModalValidator()
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName : "Rhythm")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "first name is not valid")
    }

}

