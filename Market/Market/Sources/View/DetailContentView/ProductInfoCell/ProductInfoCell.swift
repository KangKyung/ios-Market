//
//  ProductInfoCell.swift
//  Market
//
//  Created by 강경 on 2021/09/18.
//

import SwiftUI

struct ProductInfoCell: View {
    
    init(id: Int) {
        self.viewModel = ProductInfoViewModel(id: id)
    }
    
    @ObservedObject var viewModel: ProductInfoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if let product = viewModel.product {
                ProductInfoView(imageUrl: product.imageUrls.first ?? "",
                                title: product.title, isPriceDiscounted: product.isPriceDiscounted,
                                originalPrice: product.originalPrice,
                                discountedPrice: product.discountedPrice,
                                isSoldOut: product.isSoldOut, stockInfo: product.stockInfo,
                                description: product.descriptions)
            } else {
                ProgressView().frame(width: UIScreen.main.bounds.width, alignment: .center)
            }
        }
    }
}
