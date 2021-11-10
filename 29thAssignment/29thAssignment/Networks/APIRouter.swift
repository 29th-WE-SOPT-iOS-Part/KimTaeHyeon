//
//  APIRouter.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/10.
//

import Foundation

import Alamofire

enum APIRouter: URLRequestConvertible {
    // MARK: - Cases
    case signIn
    case signUp(email: String, name: String, password: String)
    
    // MARK: - Methods
    var method: HTTPMethod {
        switch self {
        case .signIn:
            return .get
        case .signUp:
            return .post
        }
    }
    
    // MARK: - Paths
    var path: String {
        switch self {
        case .signIn:
            return "/user/login"
        case .signUp(_,_,_):
            return "/user/signup"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .signIn:
            return nil
        case .signUp(let email, let name, let password):
            return [
                "email": email,
                "name": name,
                "password": password
            ]
        }
    }
    
    // MARK: - Encodings
    var encoding: ParameterEncoding {
        switch self {
        case .signIn, .signUp(_,_,_):
            return JSONEncoding.default
        }
    }
    
    // MARK: - URL Request
    func asURLRequest() throws -> URLRequest {
        let url = APIConstants.baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        
        // HTTP 메서드
        urlRequest.method = method
        
        // 헤더
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // 파라미터
        if let parameters = parameters {
            return try encoding.encode(urlRequest, with: parameters)
        }

        return urlRequest
    }
}