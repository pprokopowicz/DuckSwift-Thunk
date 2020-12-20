//
//  ThunkMiddleware.swift
//
//
//  Created by Piotr Prokopowicz on 02/10/2020.
//

import DuckSwift

/// Middleware that enables the store to process `Thunk` actions.
public struct ThunkMiddleware: Middleware {
    
    public init() {}
    
    public func body(dispatch: @escaping DispatchFunction, state: @escaping GetState) -> (@escaping DispatchFunction) -> DispatchFunction {
        return { next in
            return { action in
                switch action {
                case let thunk as Thunk:
                    thunk.body(dispatch: dispatch, state: state)
                default:
                    next(action)
                }
            }
        }
    }
    
}
