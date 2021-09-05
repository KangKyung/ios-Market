//
//  MarketNetworkModelTest.swift
//  MarketTests
//
//  Created by 강경 on 2021/09/02.
//

import XCTest
@testable import Market

class MarketNetworkModelTest: XCTestCase {
    
    var marketAPIProvider: MarketAPIProvider?
    var testExpectation: XCTestExpectation?
    
    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession.init(configuration: configuration)
        marketAPIProvider = MarketAPIProvider(session: urlSession)
        testExpectation = XCTestExpectation()
    }
    override func tearDownWithError() throws {
        marketAPIProvider = nil
        testExpectation = nil
    }
    func setRequestHandler(shouldSuccess: Bool) {
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                fatalError()
            }
            
            let response: HTTPURLResponse?
            if shouldSuccess {
                response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil,
                                           headerFields: nil)
            } else {
                response = HTTPURLResponse(url: url, statusCode: 404, httpVersion: nil,
                                           headerFields: nil)
            }
            guard let asset = NSDataAsset(name: "Item") else {
                fatalError()
            }
            let data = asset.data
            
            return (response, data, nil)
        }
    }
}
