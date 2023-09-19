//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by apple on 17.09.2023.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var toDosVM = ToDosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
