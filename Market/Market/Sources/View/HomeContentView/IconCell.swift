//
//  IconCell.swift
//  Market
//
//  Created by 강경 on 2021/09/16.
//

import SwiftUI

struct IconCell: View {
    
    let icons: [Icon] = MockStore.icons
    let height: CGFloat = 150
    var rows: [GridItem] = [
        GridItem(.flexible(minimum: 10)),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .top) {
                ForEach(icons) { icon in
                    IconView(title: icon.title)
                        .frame(height: height)
                }
                
            }
        }
    }
}
