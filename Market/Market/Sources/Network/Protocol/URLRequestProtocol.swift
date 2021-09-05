//
//  URLRequestProtocol.swift
//  Market
//
//  Created by 강경 on 2021/09/01.
//

import Foundation

protocol URLRequestProtocol {
    
    static var boundary: String { get }
    
    func makeURLRequest(httpMethod: HttpMethod, apiRequestType: RequestType) -> URLRequest?
}

extension URLRequestProtocol {
    
    func makeURLRequest(httpMethod: HttpMethod, apiRequestType: RequestType) -> URLRequest? {
        guard let url = apiRequestType.url else { return nil }
        let contentType = httpMethod.makeContentTypeText(boundary: Self.boundary)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.type
        urlRequest.setValue(contentType, forHTTPHeaderField: HttpMethod.contentType)
        
        return urlRequest
    }
}
