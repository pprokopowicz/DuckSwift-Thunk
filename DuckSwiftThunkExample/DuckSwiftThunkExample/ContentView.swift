//
//  ContentView.swift
//  DucksSwiftExample
//
//  Created by Piotr Prokopowicz on 02/10/2020.
//

import SwiftUI
import DuckSwift

struct ContentView: View {
    
    @EnvironmentObject var store: Store<AppState>
    
    var body: some View {
        VStack {
            if let todos = store.state.todos {
                List(todos, id: \.id) { todo in
                    Text(todo.title)
                }
            }
            
            Button("Fetch todos") {
                store.dispatch(action: FetchTodosThunk())
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Store(reducer: reducer, state: AppState()))
    }
}
