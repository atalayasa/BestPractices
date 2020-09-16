//
//  NetworkManager.swift
//  MasterDetailApp
//
//  Created by Atalay Aşa on 10.09.2020.
//  Copyright © 2020 Atalay Aşa. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decodingError
    case serverError
    case noData
}

final class NetworkManager {
    private let decoder = JSONDecoder()
    func getJSON<T: Decodable>(at urlPath: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlPath) else {
            completion(.failure(.badURL))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { [weak self] (data, response, error) in
            guard let `self` = self else { return }
            if let _ = error {
                completion(.failure(.serverError))
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            guard let decodedData = try? self.decoder.decode(T.self, from: data) else {
                completion(.failure(.decodingError))
                return
            }
            
            completion(.success(decodedData))
            
        }).resume()
        
    }
}
