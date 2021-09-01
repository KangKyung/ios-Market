//
//  MarketAPIProvider.swift
//  Market
//
//  Created by 강경 on 2021/09/01.
//

import Foundation

struct MarketAPIProvider {
    
    let session: URLSession
    static var boundary: String = UUID().uuidString
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    private func dataTask(with urlRequest: URLRequest,
                          completionHandler: @escaping (Result<Data, ProviderError>) -> Void) {
        session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard error == nil else {
                completionHandler(.failure(.connectionProblem))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  RequestType.successStatusCode.contains(response.statusCode) else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            completionHandler(.success(data))
        }).resume()
    }
    func getData(apiRequestType: RequestType,
                 completionHandler: @escaping (Result<Data, ProviderError>) -> Void) {
        guard let urlRequest = makeURLRequest(httpMethod: .get,
                                              apiRequestType: apiRequestType) else {
            completionHandler(.failure(.invalidRequest))
            return
        }
        
        dataTask(with: urlRequest) { data in
            completionHandler(data)
        }
    }
}

extension MarketAPIProvider: JsonRequestProtocol {
    
    func deleteProduct(product: ProductDeletionRequestModel, apiRequestType: RequestType,
                       completionHandler: @escaping (Result<Data, ProviderError>) -> Void) {
        guard let urlRequest = setJsonBody(httpMethod: .delete, apiRequestType: apiRequestType,
                                           product: product) else {
            completionHandler(.failure(.invalidRequest))
            return
        }
        
        dataTask(with: urlRequest) { data in
            completionHandler(data)
        }
    }
}

extension MarketAPIProvider: MultiPartRequestProtocol {
    
    func postProduct(product: ProductRegistrationRequestModel,
                     apiRequestType: RequestType,
                     completionHandler: @escaping (Result<Data, ProviderError>) -> Void) {
        guard let urlRequest = setMultiPartBody(httpMethod: .post, apiRequestType: apiRequestType,
                                                product: product) else {
            completionHandler(.failure(.invalidRequest))
            return
        }
        
        dataTask(with: urlRequest) { data in
            completionHandler(data)
        }
    }
    func updateProduct(product: ProductUpdateRequestModel,
                       apiRequestType: RequestType,
                       completionHandler: @escaping (Result<Data, ProviderError>) -> Void) {
        guard let urlRequest = setMultiPartBody(httpMethod: .patch, apiRequestType: apiRequestType,
                                                product: product) else {
            completionHandler(.failure(.invalidRequest))
            return
        }
        
        dataTask(with: urlRequest) { data in
            completionHandler(data)
        }
    }
}
