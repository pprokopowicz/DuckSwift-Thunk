//
//  Reducer.swift
//  DucksSwiftExample
//
//  Created by Piotr Prokopowicz on 02/10/2020.
//

import Foundation
import DuckSwift

func reducer(state: AppState, action: Action) -> AppState {
    var state = state
    
    switch action {
    case let action as SetTodosAction:
        state.todos = action.todos
    default:
        break
    }
    
    return state
}
