//
//  GetItem.swift
//  MarketTests
//
//  Created by 강경 on 2021/09/02.
//

import XCTest
@testable import Market

extension MarketNetworkModelTest {
    
    func testGet_상품_리스트_조회() {
        // given
        let responseData = NetworkModelDummy.expectedResponseListData
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                fatalError()
            }
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil,
                                           headerFields: nil)
            
            return (response, responseData, nil)
        }
        // when
        marketAPIProvider?.getProductList(apiRequestType: .loadPage(page: 1)) { result in
            // then
            switch result {
            case .success(let product):
                let expectedResponseModel =
                    try? JSONDecoder().decode(ListSearchResponseModel.self, from: responseData)
                XCTAssertEqual(product.page, expectedResponseModel?.page)
                XCTAssertEqual(product.items[0].id, expectedResponseModel?.items[0].id)
                XCTAssertEqual(product.items[0].title, expectedResponseModel?.items[0].title)
                XCTAssertEqual(product.items[0].price, expectedResponseModel?.items[0].price)
                XCTAssertEqual(product.items[0].currency,
                               expectedResponseModel?.items[0].currency)
                XCTAssertEqual(product.items[0].stock, expectedResponseModel?.items[0].stock)
                XCTAssertEqual(product.items[0].thumbnails[0],
                               expectedResponseModel?.items[0].thumbnails[0])
                XCTAssertEqual(product.items[0].registrationDate,
                               expectedResponseModel?.items[0].registrationDate)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.testExpectation?.fulfill()
        }
        
        if let expectation = testExpectation {
            wait(for: [expectation], timeout: 10)
        }
    }
    func testGet_상품_조회() {
        // given
        let responseData = NetworkModelDummy.expectedResponseData
        MockURLProtocol.requestHandler = { request in
            guard let url = request.url else {
                fatalError()
            }
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil,
                                           headerFields: nil)
            
            return (response, responseData, nil)
        }
        // when
        marketAPIProvider?.getProduct(apiRequestType: .loadProduct(id: 1)) { result in
            switch result {
            // then
            case .success(let product):
                let expectedResponseModel =
                    try? JSONDecoder().decode(ProductSearchResponseModel.self, from: responseData)
                XCTAssertEqual(product.title, expectedResponseModel?.title)
                XCTAssertEqual(product.currency, expectedResponseModel?.currency)
                XCTAssertEqual(product.descriptions, expectedResponseModel?.descriptions)
                XCTAssertEqual(product.stock, expectedResponseModel?.stock)
                XCTAssertEqual(product.price, expectedResponseModel?.price)
                XCTAssertEqual(product.images[0], expectedResponseModel?.images[0])
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.testExpectation?.fulfill()
        }
        
        if let expectation = testExpectation {
            wait(for: [expectation], timeout: 5)
        }
    }
}
