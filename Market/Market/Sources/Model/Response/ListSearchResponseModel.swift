//
//  ListSearchResponseModel.swift
//  Markket
//
//  Created by 강경 on 2021/09/01.
//

import Foundation

struct ListSearchResponseModel: Decodable {
    
    let page: Int
    let items: [Product]
}
