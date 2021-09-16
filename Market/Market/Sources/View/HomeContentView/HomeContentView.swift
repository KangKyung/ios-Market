//
//  HomeContentView.swift
//  Market
//
//  Created by 강경 on 2021/09/15.
//

import SwiftUI

struct HomeContentView: View {
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(.white)
        UINavigationBar.appearance().backgroundColor = UIColor(.white)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
        
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 40) {
                    SearchCell()
                    IconCell()
                    CardCell()
                }
                .padding()
            }
            .navigationBarTitle("Liib", displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "bell"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeContentView()
    }
}
