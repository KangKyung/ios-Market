//
//  ContentView.swift
//  Market
//
//  Created by 강경 on 2021/09/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            SearchContentView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            ProfileContentView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
