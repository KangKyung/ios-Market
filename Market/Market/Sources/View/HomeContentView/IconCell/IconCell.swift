//
//  IconCell.swift
//  Market
//
//  Created by 강경 on 2021/09/16.
//

import SwiftUI

struct IconCell: View {
    
    // TODO: - 따로 빼는게 나을지 고민하자
    // let icons: [Icon] = MockStore.icons
    let icons = [
        Icon(title: "View All"),
        Icon(title: "Moisturizer"),
        Icon(title: "Cleanser"),
        Icon(title: "Eye Care"),
        Icon(title: "Exfoliator"),
        Icon(title: "Treatment"),
        Icon(title: "Toner"),
        Icon(title: "Lip Care"),
        Icon(title: "Serums / Essence"),
        Icon(title: "Facial Suncare"),
        Icon(title: "Mask"),
        Icon(title: "Body Care")
    ]
    var rows: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .top) {
                ForEach(icons) { icon in
                    IconView(title: icon.title)
                }
            }
        }
    }
}
