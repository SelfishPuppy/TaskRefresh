//
//  TaskFormView.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//

import SwiftUI
import SwiftData

struct TaskFormView: View {
    let todoTask: TodoTask
    
    @State private var title: String
    @State private var priority: Priority
    @State private var dueDate: Date
    @State private var isCompleted: Bool
    @Query(sort: \TodoTask.sortIndex, order: .forward) private var tasks: [TodoTask]
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    private let isCreatingTodoTask: Bool
    
    init(todoTask: TodoTask?) {
        let taskToEdit: TodoTask
        if let todoTask {
            taskToEdit = todoTask
            isCreatingTodoTask = false
        } else {
            taskToEdit = TodoTask(title: "", sortIndex: -1)
            isCreatingTodoTask = true
        }
        
        self.todoTask = taskToEdit
        self.title = taskToEdit.title
        self.priority = taskToEdit.priority
        self.dueDate = taskToEdit.dueDate
        self.isCompleted = taskToEdit.isCompleted
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                Picker("Priority", selection: $priority) {
                    ForEach(Priority.allCases) { priority in
                            Text(priority.rawValue).tag(priority)
                    }
                }
                DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date])
                Toggle(isOn: $isCompleted) {
                    Text("Completed")
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    saveEdits()
                    dismiss()
                }
            }
        }
    }
    private func saveEdits() {
        
        if (todoTask.sortIndex == -1) {
            todoTask.sortIndex = (tasks.last?.sortIndex ?? -1) + 1
        }
        
        todoTask.title = title
        todoTask.priority = priority
        todoTask.dueDate = dueDate
        todoTask.isCompleted = isCompleted
        
        if isCreatingTodoTask {
            context.insert(todoTask)
        }
        
        try? context.save()
    }
}

#Preview(traits: .taskSampleData) {
    @Previewable @Query(sort: \TodoTask.sortIndex) var todoTasks: [TodoTask]
    TaskFormView(todoTask: todoTasks[0])
}
