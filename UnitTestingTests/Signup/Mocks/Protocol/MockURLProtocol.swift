//
//  MockURLProtocol.swift
//  UnitTestingTests
//
//  Created by Janani on 28/2/24.
//

import Foundation

class MockURLProtocol : URLProtocol {
    
    static var stubResponseData : Data?
    static var error : Error?
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let signUpError = MockURLProtocol.error { //for error
            self.client?.urlProtocol(self, didFailWithError: signUpError)
        }
        else { // for success
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        //
    }
    
    
}
