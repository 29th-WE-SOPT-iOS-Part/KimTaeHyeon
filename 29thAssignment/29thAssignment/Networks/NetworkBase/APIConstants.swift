//
//  APIConstants.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/10.
//

import Foundation

struct APIConstants {
    // MARK: - Start Endpoint
    static var baseURL: URL {
        return URL(string: "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api")!
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case xAuthToken = "x-auth-token"
}

enum ContentType: String {
    case json = "application/json"
}
