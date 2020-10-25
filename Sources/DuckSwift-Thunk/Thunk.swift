//
//  Thunk.swift
//
//
//  Created by Piotr Prokopowicz on 29/09/2020.
//

import DuckSwift

/**
 Thunk is a type of `Action` that allows for asynchronous operations.
 Thanks to `DispatchFunction` this action can dispatch other actions to applications store.
 Since Swift doesn't allow for protocols to have Generic types without the use of assosiatedTypes,
 `GetState` function returns some object that conforms to `StateProtocol` which needs to be cast
 to your desired state type.
 */
public protocol Thunk: Action {
    
    /// Function (usually dealing with asynchronous operations) that is called when it's dispatched to the store.
    /// - Parameter dispatch: Function used to dispatch new actions to the store.
    /// - Parameter state: Function used to get current value of state from store. It returns some object that conforms to `StateProtocol` which needs to be cast to your desired type.
    func body(dispatch: @escaping DispatchFunction, state: @escaping GetState) -> Void
    
}
