//
//  ToDoModel.swift
//  ToDoList
//
//  Created by apple on 19.09.2023.
//

import Foundation

struct ToDo: Identifiable {
  //  let id = UUID().uuidString
    var id: String?
    var item = ""
    var reminderIsOne = false
    var dueDate = Date.now
    var notes = ""
    var isCompleted = false
}
