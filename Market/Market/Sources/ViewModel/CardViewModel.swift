//
//  CardViewModel.swift
//  Market
//
//  Created by 강경 on 2021/09/16.
//

import Foundation

final class CardViewModel: ObservableObject {
    
    @Published var products: [CardViewProduct] = []
    let marketAPIProvider = MarketAPIProvider()
    static let firstPage = 1
    // FIX: - 서버에 rank정보가 들어오면 바꿔줘야 함
    var rank = 0
    
    init() {
        fetch(page: CardViewModel.firstPage)
    }
    
    func fetch(page: Int) {
        marketAPIProvider.getProductList(apiRequestType: .loadPage(page: page)) { result in
            switch result {
            case .success(let product):
                var cardViewProducts: [CardViewProduct] = []
                for item in product.items {
                    // TODO: - 하나씩 추가되도록 할건지, 한꺼번에 추가되도록 할건지 고민
                    //                    self.products.append(self.cardViewProduct(convertedFrom: item))
                    cardViewProducts.append(self.cardViewProduct(convertedFrom: item))
                }
                self.products.append(contentsOf: cardViewProducts)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    private func cardViewProduct(convertedFrom product: Product) -> CardViewProduct {
        rank += 1
        let isPriceDiscounted = product.discountedPrice != nil ? true : false
        let discountedPriceString =
            product.discountedPrice != nil ? product.currency + " \(product.discountedPrice!)" : ""
        let isSoldOut = product.stock == 0 ? true : false
        let stockInfoString = product.stock == 0 ? "sold out" : "stock: \(product.stock)"
        
        return CardViewProduct(
            id: product.id, rank: rank,
            representativeImageUrl: product.thumbnails.first ?? "",
            title: product.title, isPriceDiscounted: isPriceDiscounted,
            originalPrice: product.currency + " \(product.price)",
            discountedPrice: discountedPriceString, isSoldOut: isSoldOut,
            stockInfo: stockInfoString)
    }
}

struct CardViewProduct {
    
    let id: Int
    let rank: Int
    let representativeImageUrl: String
    let title: String
    let isPriceDiscounted: Bool
    let originalPrice: String
    let discountedPrice: String
    let isSoldOut: Bool
    let stockInfo: String
}
