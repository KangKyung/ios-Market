//
//  ProductSearchResponseModel.swift
//  Markket
//
//  Created by 강경 on 2021/09/01.
//

import Foundation

struct ProductSearchResponseModel: Decodable {
    
    let id: Int
    let title: String
    let descriptions: String
    let price: Int
    let currency: String
    let stock: Int
    let discountedPrice: Int?
    let thumbnails: [String]
    let images: [Data]
    let registrationDate: Double
    
    private enum CodingKeys: String, CodingKey {
        case id, title, description, price, currency, stock, thumbnails, images
        case discountedPrice = "discounted_price"
        case registrationDate = "registration_date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.descriptions = try container.decode(String.self, forKey: .description)
        self.price = try container.decode(Int.self, forKey: .price)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.stock = try container.decode(Int.self, forKey: .stock)
        self.discountedPrice = try container.decode(Int?.self, forKey: .discountedPrice)
        self.thumbnails = try container.decode([String].self, forKey: .thumbnails)
        self.images = try container.decode([Data].self, forKey: .images)
        self.registrationDate = try container.decode(Double.self, forKey: .registrationDate)
    }
}
