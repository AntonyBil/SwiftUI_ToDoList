//
//  ContentView.swift
//  ToDoList
//
//  Created by apple on 17.09.2023.
//

import SwiftUI

struct ToDoListView: View {
    
    var toDos = ["Learn Swift", "Build Apps", "Chenge the World", "Bring the Awesome", "Taca a Vacation" ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }

                   
                }
                

                
//                Section {
//                    NavigationLink {
//                        DetailView()
//                    } label: {
//                        Text("Winter")
//                    }
//
//                    NavigationLink {
//                        DetailView()
//                    } label: {
//                        Text("Summer")
//                    }
//                } header: {
//                    Text("Breaks")
//                }
//
//                Section {
//                    Text("Spring")
//                    Text("Fall")
//                }header: {
//                    Text("Semesters")
//                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
