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
        let urlString = product.thumbnails.first ?? ""
        let titleString = product.title
        var isPriceDiscounted: Bool
        let originalPriceString = product.currency + " \(product.price)"
        var discountedPriceString: String
        if let discountedPrice = product.discountedPrice {
            isPriceDiscounted = true
            discountedPriceString = product.currency + " \(discountedPrice)"
        } else {
            isPriceDiscounted = false
            discountedPriceString = ""
        }
        var isSoldOut: Bool
        var stockInfoString: String
        if product.stock == 0 {
            isSoldOut = true
            stockInfoString = "sold out"
        } else {
            isSoldOut = false
            stockInfoString = "stock: \(product.stock)"
        }
        
        return CardViewProduct(rank: rank, representativeImageUrl: urlString,
                               title: titleString, isPriceDiscounted: isPriceDiscounted,
                               originalPrice: originalPriceString,
                               discountedPrice: discountedPriceString, isSoldOut: isSoldOut,
                               stockInfo: stockInfoString)
    }
}

struct CardViewProduct {
    
    let rank: Int
    let representativeImageUrl: String
    let title: String
    let isPriceDiscounted: Bool
    let originalPrice: String
    let discountedPrice: String
    let isSoldOut: Bool
    let stockInfo: String
}
