//
//  SearchContentView.swift
//  Market
//
//  Created by 강경 on 2021/09/15.
//

import SwiftUI

struct SearchContentView: View {
    
    var body: some View {
        NavigationView {
            Text("SearchContentView")
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
