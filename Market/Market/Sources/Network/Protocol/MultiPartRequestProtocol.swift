//
//  MultiPartProtocol.swift
//  Market
//
//  Created by 강경 on 2021/09/01.
//

import Foundation

protocol MultiPartRequestProtocol: URLRequestProtocol {
    
    func setMultiPartBody(httpMethod: HttpMethod, apiRequestType: RequestType,
                          product: Encodable) -> URLRequest?
}

extension MultiPartRequestProtocol {
    
    func setMultiPartBody(httpMethod: HttpMethod, apiRequestType: RequestType,
                          product: Encodable) -> URLRequest? {
        guard var urlRequest = makeURLRequest(httpMethod: httpMethod,
                                              apiRequestType: apiRequestType) else { return nil }
        var data = Data()
        let mirror = Mirror(reflecting: product)
        mirror.children.forEach { key, value in
            guard let key = key else { return }
            if let images = value as? [Data] {
                data.append(multiPartBodyOfImage(imageName: key, images: images))
            } else {
                data.append(multiPartBody(name: key, value: value))
            }
        }
        data.appendString("--\(Self.boundary)--\r\n")
        urlRequest.httpBody = data
        
        return urlRequest
    }
    private func multiPartBody(name: String, value: Any) -> Data {
        var data = Data()
        data.appendString("--\(Self.boundary)\r\n")
        data.appendString("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n")
        data.appendString("\(value)\r\n")
        
        return data
    }
    private func multiPartBodyOfImage(imageName: String, images: [Data]) -> Data {
        var data = Data()
        for image in images {
            data.appendString("--\(Self.boundary)\r\n")
            data.appendString("""
                Content-Disposition: form-data; name=\"images[]\"; filename=\"\(imageName)\"\r\n
            """)
            data.appendString("Content-Type: image/png\r\n\r\n")
            data.append(image)
            data.appendString("\r\n")
        }
        
        return data
    }
}
