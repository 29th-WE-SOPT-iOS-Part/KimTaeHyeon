//
//  APIConstants.swift
//  29thSeminar4
//
//  Created by taehy.k on 2021/10/30.
//

import Foundation

struct APIConstants {
    // MARK: Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    // MARK: - Endpoints
    static let loginURL = baseURL + "/user/login"
}

extension APIConstants {
    struct Headers {
        static let contentType = ["Content-Type" : "application/json"]
    }
    
    struct Params {
        func setLoginParams(email: String,
                            password: String) -> [String:String] {
            return [
                "email": email,
                "password": password
            ]
        }
    }
}
