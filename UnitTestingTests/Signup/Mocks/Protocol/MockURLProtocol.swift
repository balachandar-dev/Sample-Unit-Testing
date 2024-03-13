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
            // TODO: Add custom error handling for the expected types
            // TODO: Add custom error code in line 30
            let errorInfo: [String : Any] = [
                NSLocalizedDescriptionKey: signUpError.localizedDescription
            ]
            let error = NSError(domain: "com.hyperl.UnitTesting", code: 0, userInfo: errorInfo)
            self.client?.urlProtocol(self, didFailWithError: error)
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
