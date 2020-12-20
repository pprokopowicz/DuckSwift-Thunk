//
//  FetchTodosThunk.swift
//  DucksSwiftExample
//
//  Created by Piotr Prokopowicz on 02/10/2020.
//

import Foundation
import DuckSwift
import DuckSwiftThunk

struct FetchTodosThunk: Thunk {
    
    func body(dispatch: @escaping DispatchFunction, state: @escaping GetState) {
        TodosService().fetch { result in
            switch result {
            case .success(let todos):
                dispatch(SetTodosAction(todos: todos))
            case .failure:
                break
            }
        }
    }
    
}
