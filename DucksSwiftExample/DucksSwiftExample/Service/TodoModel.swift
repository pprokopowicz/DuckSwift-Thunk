//
//  TodoModel.swift
//  DucksSwiftExample
//
//  Created by Piotr Prokopowicz on 04/10/2020.
//

import Foundation

struct TodoModel: Decodable {
    
    let id: Int
    let title: String
    let completed: Bool
    
}
