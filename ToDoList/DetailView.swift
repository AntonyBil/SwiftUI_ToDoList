//
//  DetailView.swift
//  ToDoList
//
//  Created by apple on 17.09.2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var toDo = ""
    @State private var reminderIsOne = false
    @State private var dueDate = Date.now
    @State private var notes = ""
    @State private var isCompleted = false
    
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Enter To Do here", text: $toDo)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminde:", isOn: $reminderIsOne)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                
                
                DatePicker("Date", selection: $dueDate)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!reminderIsOne)
                
                Text("Notes:")
                TextField("Notes", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed:", isOn: $isCompleted)
                    .listRowSeparator(.hidden)
                    .padding(.top)
                
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                    //TODO: Add Save code here
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
