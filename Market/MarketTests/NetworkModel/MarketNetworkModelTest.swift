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
}
