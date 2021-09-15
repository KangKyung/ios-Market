//
//  HomeContentView.swift
//  Market
//
//  Created by 강경 on 2021/09/15.
//

import SwiftUI

struct HomeContentView: View {
    var body: some View {
        NavigationView {
            Text("HomeContentView")
            .navigationBarTitle("Liib", displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "bell"))
            
//            NavigationLink(destination: SearchContentView()) {
//                Text("go to SearchContentView")
//            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeContentView()
//    }
//}
