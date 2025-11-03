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
    case characterImage(url: URLComponents)
}

extension CharactersRequest: RequestType {
    var scheme: String {
        switch self {
        case .characters, .character:
            "https"
        case .characterImage(let url):
            url.scheme ?? "https"
        }
    }
    
    var host: String {
        switch self {
        case .characters, .character:
            "rickandmortyapi.com"
        case .characterImage(let url):
            url.host ??  "rickandmortyapi.com"
        }
    }
    
    var path: String {
        switch self {
        case .characters(let page):
            "/api/character"
        case .character(let id):
            "/api/character/\(id)"
        case .characterImage(let url):
             url.path ?? ""
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
        case .characterImage(let url):
            return url.queryItems ?? []
        }
    }
}
