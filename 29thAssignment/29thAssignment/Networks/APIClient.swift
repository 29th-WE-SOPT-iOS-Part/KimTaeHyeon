//
//  APIClient.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/11/10.
//

import Foundation

import Alamofire

class APIClient {
    
    typealias onSuccess<T> = ((T) -> Void)              // 성공 시 클로저
    typealias onFailure = ((_ error: Error) -> Void)    // 실패 시 클로저
    
    static func request<T>(_ object: T.Type,
                                  router: APIRouter,
                                  success: @escaping onSuccess<T>,
                                  failure: @escaping onFailure) where T: Decodable {
        AF.request(router)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: object) { response in
                switch response.result {
                case .success:
                    guard let decodedData = response.value else { return }
                    success(decodedData) // 성공 시 데이터 전달
                case .failure(let err):
                    failure(err)         // 실패 시 에러 전달
                }
        }
    }
    
}
