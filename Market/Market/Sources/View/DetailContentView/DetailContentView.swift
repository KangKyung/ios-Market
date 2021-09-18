//
//  DetailContentView.swift
//  Market
//
//  Created by 강경 on 2021/09/18.
//

import SwiftUI

struct DetailContentView: View {
    
    init(id: Int) {
        self.id = id
    }
    
    let id: Int
    
    var body: some View {
        ScrollView() {
            LazyVStack(alignment: .leading, spacing: 40) {
                ProductInfoCell(id: id)
            }
            .padding()
        }
        .navigationBarTitle("Product Information", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailContentView(id: 1)
    }
}
