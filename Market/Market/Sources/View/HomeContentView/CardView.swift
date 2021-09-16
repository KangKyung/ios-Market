//
//  CardView.swift
//  Market
//
//  Created by 강경 on 2021/09/16.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    
    let url: String
    let title: String
    let price: Int
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: url))
                .resizable()
                .frame(width: 120, height: 120)
            Text(title).font(.system(size: 12))
            Text("\(price)").font(.system(size: 10))
        }
    }
}

extension Color {
    
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
