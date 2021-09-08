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
    
    private func dataTask<T: Decodable>(with urlRequest: URLRequest, decodeModel: T.Type,
                                        completion: @escaping (Result<T, ProviderError>) -> Void) {
        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(.failure(.connectionProblem))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  RequestType.successStatusCode.contains(response.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let receivedProduct = try JSONDecoder().decode(T.self, from: data)
                completion(.success(receivedProduct))
            } catch {
                
            }
        }.resume()
    }
    func getProduct(apiRequestType: RequestType,
                    completion: @escaping (Result<ProductSearchResponseModel,
                                                  ProviderError>) -> Void) {
        guard let urlRequest = makeURLRequest(httpMethod: .get,
                                              apiRequestType: apiRequestType) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        dataTask(with: urlRequest, decodeModel: ProductSearchResponseModel.self) { data in
            completion(data)
        }
    }
    func getProductList(apiRequestType: RequestType,
                        completion: @escaping (Result<ListSearchResponseModel,
                                                      ProviderError>) -> Void) {
        guard let urlRequest = makeURLRequest(httpMethod: .get,
                                              apiRequestType: apiRequestType) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        dataTask(with: urlRequest, decodeModel: ListSearchResponseModel.self) { data in
            completion(data)
        }
    }
}

extension MarketAPIProvider: JsonRequestProtocol {
    
    func deleteProduct(product: ProductDeletionRequestModel, apiRequestType: RequestType,
                       completion: @escaping (Result<ResponseModel, ProviderError>) -> Void) {
        guard let urlRequest = setJsonBody(httpMethod: .delete, apiRequestType: apiRequestType,
                                           product: product) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        dataTask(with: urlRequest, decodeModel: ResponseModel.self) { data in
            completion(data)
        }
    }
}

extension MarketAPIProvider: MultiPartRequestProtocol {
    
    func postProduct(product: ProductRegistrationRequestModel, apiRequestType: RequestType,
                     completion: @escaping (Result<ResponseModel, ProviderError>) -> Void) {
        guard let urlRequest = setMultiPartBody(httpMethod: .post, apiRequestType: apiRequestType,
                                                product: product) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        dataTask(with: urlRequest, decodeModel: ResponseModel.self) { data in
            completion(data)
        }
    }
    func updateProduct(product: ProductUpdateRequestModel, apiRequestType: RequestType,
                       completion: @escaping (Result<ResponseModel, ProviderError>) -> Void) {
        guard let urlRequest = setMultiPartBody(httpMethod: .patch, apiRequestType: apiRequestType,
                                                product: product) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        dataTask(with: urlRequest, decodeModel: ResponseModel.self) { data in
            completion(data)
        }
    }
}
