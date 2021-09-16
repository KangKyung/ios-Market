//
//  CardCell.swift
//  Market
//
//  Created by 강경 on 2021/09/16.
//

import SwiftUI

struct CardCell: View {
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible())
    ]
    let height: CGFloat = 200
    @ObservedObject var viewModel = CardViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text("Liib Top Ranking")
                Spacer()
                Text("view All")
                    .font(.system(size: 12))
            }
            
            if viewModel.products.count == 0 {
                ProgressView().frame(width: UIScreen.main.bounds.width, alignment: .center)
            } else {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<viewModel.products.count) { index in
                        let product = viewModel.products[index]
                        CardView(rank: product.rank, imageUrl: product.representativeImageUrl,
                                 title: product.title, isPriceDiscounted: product.isPriceDiscounted,
                                 originalPrice: product.originalPrice,
                                 discountedPrice: product.discountedPrice,
                                 isSoldOut: product.isSoldOut, stockInfo: product.stockInfo)
                            .frame(height: height)
                    }
                }
            }
        }
    }
}
