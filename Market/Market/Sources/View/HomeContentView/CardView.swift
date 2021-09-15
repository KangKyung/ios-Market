//
//  CardView.swift
//  Market
//
//  Created by 강경 on 2021/09/16.
//

import SwiftUI

struct CardView: View {
    
    let title: String
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12).foregroundColor(.random)
            Text(title)
                .font(.title2)
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
