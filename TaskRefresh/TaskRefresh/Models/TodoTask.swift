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
    var dueDate: Date?
    var priority: Priority = .low
    
    enum Priority {
        case low, medium, high
        
        func description() -> String {
            switch self {
            case .low: return "Low"
            case .medium: return "Medium"
            case .high: return "High"
            }
        }
    }
}
