//
//  AuthResponse.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/10.
//

import Foundation

/*
 로그인
 "id": 1,
 "name": "김우영",
 "email": "kimwy1997@gmail.com"
 
 회원가입
 "id": 4,
 "name": "우영",
 "password": 123456,
 "email": "kimwy1997@gmail.com"
 */

struct AuthResponse: Codable {
    let id: Int
    let name: String
    let password: String?
    let email: String
}

