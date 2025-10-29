//
//  CharactersRequest.swift
//  Rick&MortyApp
//
//  Created by André Barros on 29/10/25.
//

import Foundation

enum CharactersRequest {
    case characters(page: Int)
    case character(id: Int)
}

extension CharactersRequest: RequestType {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "rickandmortyapi.com"
    }
    
    var path: String {
        switch self {
        case .characters(let page):
            "/api/character"
        case .character(let id):
            "/api/character/\(id)"
        }
    }
    
    var method: HTTPMethod {
        .GET
    }
    
    var queryItens: [URLQueryItem] {
        switch self {
        case .characters(let page):
            let pageQueryParameter = URLQueryItem(name: "page", value: String(page))
            return [pageQueryParameter]
        case .character(let id):
            return []
        }
    }
}
