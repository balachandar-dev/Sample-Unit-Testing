//
//  SignupFormModalValidatorTests.swift
//  UnitTestingTests
//
//  Created by Janani on 4/6/23.
//

import XCTest
@testable import UnitTesting


class SignupFormModalValidatorTests: XCTestCase {

    var sut : SignUpFormModalValidator!
    
    override func setUp() {
         sut = SignUpFormModalValidator()
    }
   
    override  func tearDown() {
        sut = nil
    }

    func testSignupModalValidatorForfirstName() {
                
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName : "Rhythm")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "first name is not valid")
    }
    
    func testIfFirstNameIsTooShortThenFail () {
        
        let isFirstNameIsValid = sut.isFirstNameValid(firstName: "S")
        
        XCTAssertFalse(isFirstNameIsValid, "First name is valid")
    }
    
    func testIfFirstNameIsTooLongThenFail () {
        
        let isFirstNameIsValid = sut.isFirstNameValid(firstName: "RhythmBalachandar")
        
        XCTAssertFalse(isFirstNameIsValid, "First name is valid")
    }
    
   
    // MARK: Last Name Validation Unit Tests
    func testSignupModalValidatorForLastName() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "Balachandar")
        
        XCTAssertTrue(isLastNameValid, "Last name is not valid")
    }
    
    func testIfLastNameIsTooShortThenFail() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "B")
        
        XCTAssertFalse(isLastNameValid, "Last name is valid")
        
    }
    
    func testIfLastNameIsTooLongThenFail() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "RhythmBalachandar")
        
        XCTAssertFalse(isLastNameValid, "Last name is valid")
    }
    
    // MARK: Email Address Validation
    func testEmailAddressValid() {
        let isValidEmailFormat = sut.isValidEmailFormat(email: "rhythm@gmail.com")
        
        XCTAssertTrue(isValidEmailFormat, "Email is not valid")
    }
    
    func testInvalidEmailAddressValidThenFail() {
        let isValidEmailFormat = sut.isValidEmailFormat(email: "rhythm@gmail")
        
        XCTAssertFalse(isValidEmailFormat, "Email is valid")
    }
    
    // MARK: Password Validation
    func testSignupModalValidatorForPassword() {
        
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        
        XCTAssertTrue(isPasswordValid, "Password is not valid")
        
    }
    
    func testIfPasswordIsTooShortThenFail() {
        
        let isPasswordValid = sut.isPasswordValid(password: "12")
        
        XCTAssertFalse(isPasswordValid, "Password is valid")
        
    }
    
    func testIfPasswordIsTooLongThenFail() {
        
        let isPasswordValid = sut.isPasswordValid(password: "12345678901234567")
        
        XCTAssertFalse(isPasswordValid, "Password is valid")
        
    }
    func testIfTwoPasswordsMatchReturnFalse() {
        let doPasswordsMatch = sut.doPasswordsMatch(password: "Janani@123", confirmPassword: "Bala@123")
        
        XCTAssertFalse(doPasswordsMatch, "Passwords are matching")
    }

}

