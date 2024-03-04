//
//  SignupWebserviceTest.swift
//  UnitTestingTests
//
//  Created by Janani on 25/2/24.
//

import XCTest
@testable import UnitTesting

class SignupWebserviceTest: XCTestCase {
    
    var sut : SignupWebservice!
    var signUpRequestModel : SignupFormRequestModel!
    
    override func setUp() {
        
    }
    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration : config)
        
        sut = SignupWebservice(urlString : SignupConstants.signUpURL, urlSession : urlSession)
        
        signUpRequestModel = SignupFormRequestModel(firstName : "John", lastName : "Cena", email : "johncena@wwe.com", password : "1234")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        sut = nil
        signUpRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupWebservice_WhenGivenSuccessfulREsponse_ReturnsSuccess() {
        
        let jsonString = "{\"status\": \"Ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using : .utf8)
        
        let expectation = self.expectation(description : "Signup web service response exception")
        
        sut.signUp(withForm : signUpRequestModel) { (signUpResponseModel, error) in
            
            // "{"status" : "Ok"}"
            XCTAssertEqual(signUpResponseModel?.status, "Ok")
            expectation.fulfill()
        }
        self.wait(for:[expectation] , timeout: 5)
    }
    
    func testSignupWebservice_WhenGivenDifferentResponse_ReturnsError(){
        let jsonString = "{\"message\" : \"error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using : .utf8)
        let expectation = self.expectation(description: "Signup Webservice response exception error")
        
        sut.signUp(withForm : signUpRequestModel) { (signUpResponseModel , error) in
            XCTAssertNil(signUpResponseModel, "The response model is nil")
            XCTAssertEqual(error, SignupError.responseModelParsingError, "Signup method returned error because the response model is not expected")
            expectation.fulfill()
        }
        self.wait(for : [expectation], timeout : 5)
    }
    
    func testSignupWebservice_WhenGivenWrongURL_ReturnsError(){
     
        let expectation = self.expectation(description : "Empty url")
        sut = SignupWebservice(urlString : "")
        
        sut.signUp(withForm : signUpRequestModel) { (signUpResponseModel , error) in
            XCTAssertEqual(error, SignupError.invalidURLException, "Signup method returned error because url was invalid")
            XCTAssertNil(signUpResponseModel, "Signup response model is nil as expected")
            expectation.fulfill()
        }
        self.wait(for : [expectation], timeout : 5)
    }
    
    func testSignupWebservice_WhenURLRequestFails_ReturnsError() {
        let errorDescription = "A localised description for error"
        let expectation = self.expectation(description : "A failed request expectation")
        MockURLProtocol.error = SignupError.failedRequest(description : errorDescription)
        
        sut.signUp(withForm : signUpRequestModel) { (signUpResponseModel, error) in
            XCTAssertEqual(error, SignupError.failedRequest(description : errorDescription))
            XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        self.wait(for : [expectation], timeout : 2)
    }
}
