//
//  SignupViewControllerTests.swift
//  UnitTestingTests
//
//  Created by Janani on 18/3/24.
//

import XCTest
@testable import UnitTesting

class SignupViewControllerTests: XCTestCase {

    var storyboard : UIStoryboard!
    var sut : SignupViewController!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as SignupViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        storyboard = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewController_WhenLaunched_TextfieldsAreEmpty() {
        
        XCTAssertEqual(sut?.firstNameTextField.text, "", "The first name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut?.lastNameTextField.text, "", "The last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut?.emailTextField.text, "", "The email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut?.passwordTextField.text, "", "The password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(sut?.confirmPasswordTextField.text, "", "The confirm password text field was not empty when the view controller initially loaded")
    }

}
