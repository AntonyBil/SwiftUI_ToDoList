//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by apple on 19.09.2023.
//

import Foundation

class ToDosViewModel:ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        //Temp Data here. Will eventually load in saved data
        toDos.append(ToDo(id: UUID().uuidString, item: "Learn Swift"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Build Apps"))
        toDos.append(ToDo(id: UUID().uuidString, item: "Change the World!"))
    }
    
    func saveToDo(toDo: ToDo) {
        //if new, append to toDoVM.toDos else update the toDo that was passed infrom the List
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else {
            //find curent toDo in toDos array and chenge it value
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
    }
    
    func deleteToDo(indexSet: IndexSet) {
        //delete the row
            toDos.remove(atOffsets: indexSet)
    }
    
    func moveToDo(fromOfsets: IndexSet, toOfsets: Int) {
        //mowe the row
            toDos.move(fromOffsets: fromOfsets, toOffset: toOfsets)
    }
    
}
