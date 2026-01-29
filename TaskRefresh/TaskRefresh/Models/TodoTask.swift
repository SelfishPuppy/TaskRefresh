//
//  TodoTask.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//

import Foundation

struct TodoTask: Identifiable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var dueDate: Date = Date()
    var priority: Priority = .low
    
    static var emptyTask: TodoTask {
        TodoTask(title: "")
    }
    
}

