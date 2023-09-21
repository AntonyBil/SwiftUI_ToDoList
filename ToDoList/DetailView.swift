//
//  DetailView.swift
//  ToDoList
//
//  Created by apple on 17.09.2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State var toDo: ToDo
    var newToDo = false
    
    
    var body: some View {
            List {
                TextField("Enter To Do here", text: $toDo.item)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminde:", isOn: $toDo.reminderIsOne)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                
                
                DatePicker("Date", selection: $toDo.dueDate)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!toDo.reminderIsOne)
                
                Text("Notes:")
                TextField("Notes", text: $toDo.notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed:", isOn: $toDo.isCompleted)
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
                        toDosVM.saveToDo(toDo: toDo)
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(toDo: ToDo())
            .environmentObject(ToDosViewModel())
    }
}
