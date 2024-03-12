//
//  SignUpWebserviceProtocol.swift
//  UnitTesting
//
//  Created by Janani on 12/3/24.
//

import Foundation

protocol SignupWebserviceProtocol {
        func signUp(withForm formModel: SignupFormRequestModel, completionHandler : @escaping (SignupFormResponseModel?, SignupError?) -> Void)
}
