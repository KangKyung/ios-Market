//
//  ProfileContentView.swift
//  Market
//
//  Created by 강경 on 2021/09/15.
//

import SwiftUI

struct ProfileContentView: View {
    
    var body: some View {
        NavigationView {
            Text("SearchContentView")
            .navigationBarTitle("My Liib", displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "gearshape.fill"))
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeContentView()
//    }
//}
