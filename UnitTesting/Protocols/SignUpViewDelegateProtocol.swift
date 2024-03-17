//
//  SignUpViewDelegateProtocol.swift
//  UnitTesting
//
//  Created by Janani on 16/3/24.
//

import Foundation

protocol SignUpViewDelegateProtocol : AnyObject {
    func successfullSignup()
    func errorHandler(error : SignupError)
}
