//
//  ProductInfoView.swift
//  Market
//
//  Created by 강경 on 2021/09/18.
//

import SwiftUI
import Kingfisher

struct ProductInfoView: View {
    
    let imageUrl: String
    let title: String
    let isPriceDiscounted: Bool
    let originalPrice: String
    let discountedPrice: String
    let isSoldOut: Bool
    let stockInfo: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fill)
            HStack {
                Text(title)
                    .font(.system(size: 20))
                    .bold()
                Spacer()
                if isSoldOut {
                    Text(stockInfo)
                        .font(.system(size: 15))
                        .foregroundColor(.orange)
                } else {
                    Text(stockInfo)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
            }
            HStack() {
                Spacer()
                if isPriceDiscounted {
                    Text(originalPrice)
                        .font(.system(size: 15))
                        .strikethrough()
                        .foregroundColor(.red)
                } else {
                    Text(originalPrice)
                        .font(.system(size: 15))
                }
            }
            HStack() {
                Spacer()
                if isPriceDiscounted {
                    Text(discountedPrice)
                        .font(.system(size: 15))
                }
            }
            Divider()
            Text(description)
                .font(.system(size: 12))
                .lineLimit(nil)
        }
    }
}
