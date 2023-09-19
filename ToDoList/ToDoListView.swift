//
//  ContentView.swift
//  ToDoList
//
//  Created by apple on 17.09.2023.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    
    @EnvironmentObject var toDosVM: ToDosViewModel
   
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDosVM.toDos) { toDo in
                    NavigationLink {
                        DetailView(toDo: toDo)
                    } label: {
                        Text(toDo.item)
                    }
                    .font(.title2)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            //Present modaly
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo(), newToDo: true)
                }
            }
            //FullScreenPresent
//            .fullScreenCover(isPresented: $sheetIsPresented) {
//                DetailView()
//            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ToDoListView()
                .environmentObject(ToDosViewModel())
        }
    }
}
