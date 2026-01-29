//
//  TodoTask.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//

import Foundation
import SwiftData

@Model
class TodoTask: Identifiable {
    var id: UUID
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var priority: Priority
    var sortIndex: Int
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, dueDate: Date = Date(), priority: Priority = .low, sortIndex: Int ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.priority = priority
        self.sortIndex = sortIndex
    }
}

