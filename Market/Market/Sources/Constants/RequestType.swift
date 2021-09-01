//
//  RequestType.swift
//  Market
//
//  Created by 강경 on 2021/09/01.
//

import Foundation

enum RequestType {
    
    case loadPage(page: Int)
    case loadProduct(id: Int)
    case postProduct
    case patchProduct(id: Int)
    case deleteProduct(id: Int)
    
    private var urlPath: String {
        switch self {
        case .loadPage(let page):
            return "/items/\(page)"
        case .loadProduct(let id):
            return "/item/\(id)"
        case .postProduct:
            return "/item/"
        case .patchProduct(let id):
            return "/item/\(id)"
        case .deleteProduct(let id):
            return "/item/\(id)"
        }
    }
    var url: URL? {
        return URL(string: "\(RequestType.baseURL)\(urlPath)")
    }
    var httpMethod: HttpMethod {
        switch self {
        case .loadPage:
            return .get
        case .loadProduct:
            return .get
        case .postProduct:
            return .post
        case .patchProduct:
            return .patch
        case .deleteProduct:
            return .delete
        }
    }
    static let successStatusCode: ClosedRange<Int> = (200...299)
    static let baseURL: String = "https://camp-open-market-2.herokuapp.com"
}
