//
//  ContentView.swift
//  ToDoList
//
//  Created by apple on 17.09.2023.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    
    var toDos = ["Learn Swift", "Build Apps", "Chenge the World", "Bring the Awesome", "Taca a Vacation" ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView()
                    } label: {
                        Text(toDo)
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
                DetailView()
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
        ToDoListView()
    }
}
