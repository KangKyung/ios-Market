//
//  Data.swift
//  Market
//
//  Created by 강경 on 2021/09/01.
//

import Foundation

extension Data {
    
    mutating func appendString(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
