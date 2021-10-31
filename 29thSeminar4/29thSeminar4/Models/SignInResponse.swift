//
//  SignInResponse.swift
//  29thSeminar4
//
//  Created by taehy.k on 2021/10/30.
//

import Foundation

struct SignInResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignInData?
}

struct SignInData: Codable {
    let id: Int
    let name, email: String
}
