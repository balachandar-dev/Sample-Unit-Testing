//
//  SignupError.swift
//  UnitTesting
//
//  Created by Janani on 26/2/24.
//

import Foundation

enum SignupError : LocalizedError, Equatable {
    case responseModelParsingError
    case invalidURLException
    case failedRequest(description : String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
          return description
        case .responseModelParsingError, .invalidURLException :
            return ""
        }
    }
}
