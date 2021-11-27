//
//  CommonResponse.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/10.
//

import Foundation

struct CommonResponse<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: T?
}
