//
//  RequestType.swift
//  Rick&MortyApp
//
//  Created by André Barros on 29/10/25.
//

import Foundation

protocol RequestType {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItens: [URLQueryItem] { get }
    
    func urlRequest() -> URLRequest?
}

extension RequestType {
    func urlRequest() -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryItens
        
        guard let url = urlComponents.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
