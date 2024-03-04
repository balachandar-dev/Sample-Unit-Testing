//
//  SignupFormRequestModel.swift
//  UnitTesting
//
//  Created by Janani on 26/2/24.
//

import Foundation

struct SignupFormRequestModel : Encodable {
    let firstName : String
    let lastName : String
    let email : String
    let password : String
}
