//
//  SignUpPresenterTests.swift
//  UnitTestingTests
//
//  Created by Janani on 5/3/24.
//

import XCTest
@testable import UnitTesting

class SignUpPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty()  {
        let signUpFormModel = SignupFormModel(firstName : "John",
                                              lastName : "Cena",
                                              email : "john@wwe.com",
                                              password : "123456",
                                              repeatPassword : "123456")
        let mockValidator = MockSignupModelValidator()
        let sut = SignupPresenter(formModelValidator : mockValidator)
        sut.processUserSignup(formModel : signUpFormModel)
        
        XCTAssertTrue(mockValidator.isFirstNameValidated, "The first name was not validated")
        XCTAssertTrue(mockValidator.isLastNameValidated, "The last name was not validated")
        XCTAssertTrue(mockValidator.isEmailValidated, "The email was not validated")
        XCTAssertTrue(mockValidator.isPasswordValidated, "The password was not validated")
        XCTAssertTrue(mockValidator.isPasswordMatchValidated, "Did not validate if passwords match")
    }

}
