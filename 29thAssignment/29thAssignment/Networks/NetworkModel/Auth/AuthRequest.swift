//
//  AuthRequest.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/10.
//

import Foundation

/*
 로그인
 "email": "kimwy1997@gmail.com",
 "password": "123456"
 
 회원가입
 "email": "kimwy1997@gmail.com",
 "name": "우영",
 "password": 123456
 */

struct AuthRequest: Codable {
    let email: String
    let name: String?
    let password: String
}
