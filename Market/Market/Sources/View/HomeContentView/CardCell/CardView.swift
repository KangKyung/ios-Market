//
//  CardView.swift
//  Market
//
//  Created by 강경 on 2021/09/16.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    
    let rank: Int
    let imageUrl: String
    let title: String
    let isPriceDiscounted: Bool
    let originalPrice: String
    let discountedPrice: String
    let isSoldOut: Bool
    let stockInfo: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                if rank == 1 {
                    Text("\(rank) 👑")
                        .font(.system(size: 12))
                        .foregroundColor(.red)
                        .bold()
                } else if rank > 1 && rank < 4 {
                    Text("\(rank)")
                        .font(.system(size: 12))
                        .foregroundColor(.orange)
                        .bold()
                } else {
                    Text("\(rank)")
                        .font(.system(size: 12))
                        .foregroundColor(.green)
                        .bold()
                }
                KFImage(URL(string: imageUrl))
                    .resizable()
                    .frame(width: 130, height: 140)
            }
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(.black)
            HStack {
                if isPriceDiscounted {
                    Text(originalPrice)
                        .font(.system(size: 10))
                        .strikethrough()
                        .foregroundColor(.red)
                    Text(discountedPrice)
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                } else {
                    Text(originalPrice)
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                }
            }
            if isSoldOut {
                Text(stockInfo)
                    .font(.system(size: 10))
                    .foregroundColor(.orange)
            } else {
                Text(stockInfo)
                    .font(.system(size: 10))
                    .foregroundColor(.black)
            }
            
        }
    }
}
