//
//  SearchCell.swift
//  Market
//
//  Created by 강경 on 2021/09/16.
//

import SwiftUI

struct SearchCell: View {
    
    @State private var string: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Find products that are safe and"+"\n"+"help you care for your skin")
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Brand, product, ingredient", text: $string)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black)
            )
        }
    }
}
