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
            // TODO: - change Image
            Image(systemName: "pencil.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
            Text(title)
                .font(.system(size: 10))
                .lineLimit(nil)
        }
        .frame(idealWidth: 60, idealHeight: 150, alignment: .top)
    }
}
