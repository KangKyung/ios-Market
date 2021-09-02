//
//  NetworkModelDummy.swift
//  MarketTests
//
//  Created by 강경 on 2021/09/02.
//

import Foundation
@testable import Market

struct NetworkModelDummy {
    static let productRegistrationRequestModel =
        ProductRegistrationRequestModel(title: "더미 MacBook Pro",
                                        descriptions: "더미로 만든 MacBook Pro 입니다.",
                                        price: 3_700_000, currency: "", stock: 10,
                                        discountedPrice: 2_500_000, images: [],
                                        password: "MacBookPro1234")
    static let productUpdateRequestModel =
        ProductUpdateRequestModel(title: "더미 MacBook Air", descriptions: nil, price: nil,
                                  currency: nil, stock: nil, discountedPrice: nil, images: nil,
                                  password: "MacBookAir1234")
    static let productDeletionRequestModel = ProductDeletionRequestModel(password: "1234")
}
