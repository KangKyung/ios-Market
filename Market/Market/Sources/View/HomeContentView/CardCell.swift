//
//  CardCell.swift
//  Market
//
//  Created by 강경 on 2021/09/16.
//

import Combine
import SwiftUI

struct CardCell: View {
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible())
    ]
    let height: CGFloat = 150
    @ObservedObject var viewModel = CardViewModel()
    
    var body: some View {
        ScrollView {
            HStack(alignment: .center, spacing: 10){
                Text("Liib Top Ranking")
                Spacer()
                Text("view All")
                    .font(.system(size: 12))
            }
            
            if viewModel.products.count == 0 {
                ProgressView().frame(width: UIScreen.main.bounds.width, alignment: .center)
            } else {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<viewModel.products.count) { index in
                        CardView(url: viewModel.products[index].thumbnails[0],
                                 title: viewModel.products[index].title,
                                 price: viewModel.products[index].price)
                            .frame(height: height)
                    }
                }
            }
            
            
        }
    }
}


final class CardViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    let marketAPIProvider = MarketAPIProvider()
    
    init() {
        marketAPIProvider.getProductList(apiRequestType: .loadPage(page: 1)) { result in
            switch result {
            case .success(let product):
                self.products = product.items
                print(self.products.count)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //    private func fetchData() {
    //        marketAPIProvider.getProductList(apiRequestType: .loadPage(page: 1)) { result in
    //            switch result {
    //            case .success(let product):
    //                self.products = product.items
    //                print(self.products.count)
    //            case .failure(let error):
    //                print(error.localizedDescription)
    //            }
    //        }
    //    }
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
