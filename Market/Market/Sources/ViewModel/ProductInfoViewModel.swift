//
//  ProductInfoViewModel.swift
//  Market
//
//  Created by 강경 on 2021/09/18.
//

import Foundation

final class ProductInfoViewModel: ObservableObject {
    
    init(id: Int) {
        fetch(id: id)
    }
    
    @Published var product: DetailContentProduct?
    let marketAPIProvider = MarketAPIProvider()
    
    func fetch(id: Int) {
        marketAPIProvider.getProduct(apiRequestType: .loadProduct(id: id)) { result in
            switch result {
            case .success(let product):
                self.product = self.detailContentProduct(convertedFrom: product)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    private func detailContentProduct(convertedFrom product: ProductSearchResponseModel
    ) -> DetailContentProduct {
        let discountedPriceString =
            product.discountedPrice != nil ? product.currency + " \(product.discountedPrice!)" : ""
        let isSoldOut = product.stock == 0 ? true : false
        let stockInfoString = product.stock == 0 ? "sold out" : "stock: \(product.stock)"
        
        return DetailContentProduct(
            imageUrls: product.images, thumbnailUrls: product.thumbnails, title: product.title,
            descriptions: product.descriptions,
            isPriceDiscounted: product.discountedPrice != nil ? true : false,
            originalPrice: product.currency + " \(product.price)",
            discountedPrice: discountedPriceString, isSoldOut: isSoldOut,
            stockInfo: stockInfoString)
    }
}

struct DetailContentProduct {
    
    let imageUrls: [String]
    let thumbnailUrls: [String]
    let title: String
    let descriptions: String
    let isPriceDiscounted: Bool
    let originalPrice: String
    let discountedPrice: String
    let isSoldOut: Bool
    let stockInfo: String
}
