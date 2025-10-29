//
//  RequestError.swift
//  Rick&MortyApp
//
//  Created by André Barros on 29/10/25.
//

enum RequestError: Error {
    case invalidURL
    case requestError(Error)
    case invalidStatusCodeRange(Int)
    case decodingFailed(Error)
}
