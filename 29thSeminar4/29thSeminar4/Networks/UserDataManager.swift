//
//  UserDataManager.swift
//  29thSeminar4
//
//  Created by taehy.k on 2021/10/30.
//

import Foundation

import Alamofire

struct UserDataManger {
    static let shared = UserDataManger()
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let url = APIConstants.loginURL
        
    }
}
