//
//  IconView.swift
//  Market
//
//  Created by 강경 on 2021/09/16.
//

import SwiftUI

struct IconView: View {
    
    let title: String
    var body: some View {
        VStack {
            Image(systemName: "pencil.circle.fill")
            Text(title)
                .font(.system(size: 10))
                .lineLimit(nil)
            
        }
        .frame(
            minWidth: 0,
            idealWidth: 60,
            maxWidth: 60,
            minHeight: 0,
            idealHeight: 100,
            maxHeight: 100,
            alignment: .top
        )
    }
}
