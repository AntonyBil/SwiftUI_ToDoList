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
}
