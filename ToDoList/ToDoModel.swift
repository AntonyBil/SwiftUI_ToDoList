//
//  ToDoModel.swift
//  ToDoList
//
//  Created by apple on 19.09.2023.
//

import Foundation

struct ToDo: Identifiable {
    var id = UUID().uuidString
    var item = ""
    var reminderIsOne = false
    var dueDate = Date.now
    var notes = ""
    var isCompleted = false
}
