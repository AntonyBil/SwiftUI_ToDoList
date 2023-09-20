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
        toDos.append(ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append(ToDo(item: "Change the World!"))
    }
    
    func saveToDo(toDo: ToDo, newToDo: Bool) {
        //if new, append to toDoVM.toDos else update the toDo that was passed infrom the List
            if newToDo {
                toDos.append(toDo)
            } else {
                //find curent toDo in toDos array and chenge it value
                if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                    toDos[index] = toDo
                }
            }
    }
    
}
