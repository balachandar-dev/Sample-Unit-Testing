//
//  SignupwebService.swift
//  UnitTesting
//
//  Created by Janani on 26/2/24.
//

import Foundation

class SignupWebservice : SignupWebserviceProtocol {
    
    private var urlSession : URLSession
    private let urlString : String
    
    init(urlString : String, urlSession : URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signUp(withForm formModel: SignupFormRequestModel, completionHandler : @escaping (SignupFormResponseModel?, SignupError?) -> Void)  {
        guard let url = URL(string : urlString) else {
            completionHandler(nil, .invalidURLException)
            return
        }
        var request = URLRequest(url : url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField : "Content-Type")
        request.setValue("application/json", forHTTPHeaderField : "Accept")
        
        request.httpBody =  try! JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with : request) { (data, response, error) in
            
            if let requestError = error {
                completionHandler(nil, .failedRequest(description: requestError.localizedDescription))
                return
            }
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupFormResponseModel.self, from : data) {
                completionHandler(signupResponseModel, nil)
            }
            else {
                completionHandler(nil, .responseModelParsingError)
            }
        }
        
        dataTask.resume()
    }
}
