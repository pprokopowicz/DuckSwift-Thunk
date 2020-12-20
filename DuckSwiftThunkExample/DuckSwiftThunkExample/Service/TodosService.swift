//
//  TodosService.swift
//  DucksSwiftExample
//
//  Created by Piotr Prokopowicz on 04/10/2020.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case decodingError
    case noData
}

struct TodosService {
    
    func fetch(completion: @escaping (Result<[TodoModel], NetworkError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") else {
            DispatchQueue.main.async {
                completion(.failure(.invalidUrl))
            }
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.noData))
                }
                return
            }
            
            guard let response = try? JSONDecoder().decode([TodoModel].self, from: data) else {
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(response))
            }
        }.resume()
    }
    
}
