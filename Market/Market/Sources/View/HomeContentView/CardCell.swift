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
    let height: CGFloat = 150
    let cards: [Card] = MockStore.cards

    var body: some View {
        ScrollView {
            HStack(alignment: .center, spacing: 10){
                Text("Liib Top Ranking")
                Spacer()
                Text("view All")
            }

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(cards) { card in
                    CardView(title: card.title)
                        .frame(height: height)
                }
            }
        }
    }
}

struct MockStore {
    static var cards = [
        Card(title: "Italy"),
        Card(title: "England"),
        Card(title: "Portugal"),
        Card(title: "Belgium"),
        Card(title: "Germany"),
        Card(title: "Mexico"),
        Card(title: "Canada"),
        Card(title: "Italy"),
        Card(title: "England"),
        Card(title: "Portugal"),
        Card(title: "Belgium"),
        Card(title: "Germany"),
        Card(title: "Mexico"),
        Card(title: "Canada"),
        Card(title: "England"),
        Card(title: "Portugal"),
        Card(title: "Belgium"),
        Card(title: "Germany"),
        Card(title: "Mexico"),
        Card(title: "Canada"),
    ]
    static var icons = [
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
}
