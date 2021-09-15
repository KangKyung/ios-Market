//
//  JsonProtocol.swift
//  Market
//
//  Created by 강경 on 2021/09/01.
//

import Foundation

protocol JsonRequestProtocol: URLRequestProtocol {
    
    func setJsonBody<T: Encodable>(httpMethod: HttpMethod, apiRequestType: RequestType,
                                   product: T) -> URLRequest?
}

extension JsonRequestProtocol {
    
    func setJsonBody<T: Encodable>(httpMethod: HttpMethod, apiRequestType: RequestType,
                                   product: T) -> URLRequest? {
        guard let encodedData = try? JSONEncoder().encode(product) else { return nil }
        guard var urlRequest = makeURLRequest(httpMethod: httpMethod,
                                              apiRequestType: apiRequestType) else { return nil }
        urlRequest.httpBody = encodedData
        
        return urlRequest
    }
}
