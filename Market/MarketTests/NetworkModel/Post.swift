//
//  Post.swift
//  MarketTests
//
//  Created by 강경 on 2021/09/02.
//

import XCTest
@testable import Market

extension MarketNetworkModelTest {
    
    func testPost_상품_등록() {
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
        marketAPIProvider?.postProduct(product: NetworkModelDummy.productRegistrationRequestModel,
                                       apiRequestType: .postProduct
        ) { (result: Result<ResponseModel, ProviderError>) in
            // then
            switch result {
            case .success(let product):
                do {
                    let expectedResponseModel =
                        try JSONDecoder().decode(ProductSearchResponseModel.self,
                                                 from: responseData)
                    XCTAssertEqual(product.title, expectedResponseModel.title)
                    XCTAssertEqual(product.currency, expectedResponseModel.currency)
                    XCTAssertEqual(product.descriptions, expectedResponseModel.descriptions)
                    XCTAssertEqual(product.stock, expectedResponseModel.stock)
                    XCTAssertEqual(product.price, expectedResponseModel.price)
                    XCTAssertEqual(product.images[0], expectedResponseModel.images[0])

                } catch {
                    print(error)
                }
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            self.testExpectation?.fulfill()
        }
        
        if let expectation = testExpectation {
            wait(for: [expectation], timeout: 10)
        }
    }
}
