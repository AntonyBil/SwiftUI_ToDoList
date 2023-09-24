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
        loadData()
    }
    
    func toggleCompleted(toDo: ToDo) {
        guard toDo.id != nil else { return }
        var newToDo = toDo
        newToDo.isCompleted.toggle()
        if let index = toDos.firstIndex(where: {$0.id == newToDo.id}) {
            toDos[index] = newToDo
        }
        saveData()
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
        saveData()
    }
    
    func deleteToDo(indexSet: IndexSet) {
        //delete the row
            toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveToDo(fromOfsets: IndexSet, toOfsets: Int) {
        //mowe the row
            toDos.move(fromOffsets: fromOfsets, toOffset: toOfsets)
        saveData()
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(components: "toDos")
        let data = try? JSONEncoder().encode(toDos)     //try? means if error is thrown, data = nil
        do {
            try data?.write(to: path)
        } catch {
            print("ERROR:😡 Could not save data \(error.localizedDescription)")
        }
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(components: "toDos")
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
}
