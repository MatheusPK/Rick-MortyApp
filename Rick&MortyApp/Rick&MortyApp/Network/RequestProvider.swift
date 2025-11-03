//
//  RequestProvider.swift
//  Rick&MortyApp
//
//  Created by André Barros on 29/10/25.
//
import Foundation

protocol RequestProvider {
    func make<T: Decodable>(request: RequestType, completion: @escaping (Result<T?, RequestError>) -> Void)
    func fetchData(request: RequestType, completion: @escaping (Result<Data?, RequestError>) -> Void)
}

final class RequestProviderImp: RequestProvider {
    func fetchData(request: any RequestType, completion: @escaping (Result<Data?, RequestError>) -> Void) {
        guard let urlRequest = request.urlRequest() else {
            completion(.failure(.invalidURL))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error {
                completion(.failure(.requestError(error)))
                return
            }
            
            if let httpURLResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpURLResponse.statusCode) {
                completion(.failure(.invalidStatusCodeRange(httpURLResponse.statusCode)))
            }
            
            guard let data else {
                completion(.success(nil))
                return
            }
            
            completion(.success(data))
        }
        
        dataTask.resume()
    }
    
    func make<T: Decodable>(request: RequestType, completion: @escaping (Result<T?, RequestError>) -> Void) {
        fetchData(request: request) { result in
            switch result {
            case .success(let data):
                guard let data else { return completion(.success(nil)) }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.decodingFailed(error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
