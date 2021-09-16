//
//  SearchContentView.swift
//  Market
//
//  Created by 강경 on 2021/09/15.
//

import SwiftUI

struct SearchContentView: View {
    
    @State private var string: String = ""
    
    var body: some View {
        NavigationView {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Brand, product, ingredient", text: $string)
            }
            .navigationBarTitle("Text Field", displayMode: .inline)
            .navigationBarItems(leading: Image(systemName: "arrow.backward"))
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeContentView()
//    }
//}
