//
//  ValidityCheck.swift
//  MarketTests
//
//  Created by 강경 on 2021/09/02.
//

import XCTest

extension MarketNetworkModelTest {
    
    func testURL_유효성_검사() {
        MockURLProtocol.requestHandler = { request in
            if request.url == nil {
                XCTFail("유효하지 않는 url")
                fatalError()
            }
            XCTAssert(true)
            
            return (nil, nil, nil)
        }
    }
    func testMockData_유효성_검사() {
        if NSDataAsset(name: "Item") != nil {
            XCTAssert(true)
            return
        }
        XCTFail("파일 존재x")
    }
}
