//
//  ContentView.swift
//  ToDoList
//
//  Created by apple on 17.09.2023.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
