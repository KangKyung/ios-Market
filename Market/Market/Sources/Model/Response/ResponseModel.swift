//
//  ResponseModel.swift
//  Market
//
//  Created by 강경 on 2021/09/05.
//

import Foundation

struct ResponseModel: Decodable {
    
    let id: Int
    let title: String
    let descriptions: String
    let price: Int
    let currency: String
    let stock: Int
    let thumbnails: [String]
    let images: [String]
    let registrationDate: Double
    
    private enum CodingKeys: String, CodingKey {
        case id, title, descriptions, price, currency, stock, thumbnails, images
        case registrationDate = "registration_date"
    }
}
