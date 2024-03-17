//
//  SignUpPresenterTests.swift
//  UnitTestingTests
//
//  Created by Janani on 5/3/24.
//

import XCTest
@testable import UnitTesting

class SignUpPresenterTests: XCTestCase {

    var signUpFormModel : SignupFormModel!
    var mockValidator : MockSignupModelValidator!
    var mockSignUpWebservice : MockSignupWebservice!
    var sut : SignupPresenter!
    var mockSignupDelegate : MockSignupViewDelegate!

    override func setUpWithError() throws {
        signUpFormModel = SignupFormModel(firstName : "John",
                                              lastName : "Cena",
                                              email : "john@wwe.com",
                                              password : "123456",
                                              repeatPassword : "123456")
        mockValidator = MockSignupModelValidator()
        mockSignUpWebservice = MockSignupWebservice()

        mockSignupDelegate = MockSignupViewDelegate()

        sut = SignupPresenter(formModelValidator : mockValidator, webservice : mockSignUpWebservice, viewDelegate : mockSignupDelegate)
    }

    override func tearDownWithError() throws {
        signUpFormModel = nil
        mockValidator = nil
        mockSignUpWebservice = nil
        sut = nil
        mockSignupDelegate = nil
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty()  {
       
        sut.processUserSignup(formModel : signUpFormModel)
        
        XCTAssertTrue(mockValidator.isFirstNameValidated, "The first name was not validated")
        XCTAssertTrue(mockValidator.isLastNameValidated, "The last name was not validated")
        XCTAssertTrue(mockValidator.isEmailValidated, "The email was not validated")
        XCTAssertTrue(mockValidator.isPasswordValidated, "The password was not validated")
        XCTAssertTrue(mockValidator.isPasswordMatchValidated, "Did not validate if passwords match")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignup() {
    
        sut.processUserSignup(formModel: signUpFormModel)
        
        XCTAssertTrue(mockSignUpWebservice.isSignupMethodCalled, "The Signup() method was not called in the SignupWebservice")
        
    }
    
    func testSignupPresenter_WhenSignupOperationSuccess_CallSuccessOnViewDelegate() {
        let myExpectation = expectation(description: "Expected successfullSignup() method to get called")
        mockSignupDelegate.expectation = myExpectation
        
        sut.processUserSignup(formModel: signUpFormModel)
        self.wait(for : [myExpectation], timeout : 5)
    }

}
