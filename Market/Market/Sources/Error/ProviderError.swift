//
//  ProviderError.swift
//  Market
//
//  Created by 강경 on 2021/09/01.
//

import Foundation

enum ProviderError: Error {
    
    case connectionProblem
    case invalidData
    case invalidRequest
    case invalidResponse
}
