//
//  DetailView.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//

import SwiftUI
import SwiftData

struct TaskDetailView: View {
    let todoTask: TodoTask
    
    @State private var showEditTaskSheet = false
    @State private var isCompleted: Bool
    
    init(todoTask: TodoTask) {
        self.todoTask = todoTask
        self.isCompleted = todoTask.isCompleted
    }

    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: todoTask.dueDate)
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Title")
                    Spacer()
                    Text(todoTask.title)
                }
                HStack {
                    Text("Completed")
                    Spacer()
                    Toggle(isOn: $isCompleted) {
                        EmptyView()
                    }
                    .scaleEffect(1.5)
                    .padding(.trailing, 10)
                }
                HStack {
                    Text("Due Date")
                    Spacer()
                    Text(formattedDate)
                }
                HStack {
                    Text("Priority")
                    Spacer()
                    Text(todoTask.priority.name)
                }
            }
        }
        .navigationTitle("Details")
        .toolbar {
            Button("Edit") {
                showEditTaskSheet = true
            }
        }
        .sheet(isPresented: $showEditTaskSheet) {
            NavigationStack {
                TaskFormView(todoTask: todoTask)
                    .navigationTitle(todoTask.title)
            }
        }
    }
}

#Preview(traits: .taskSampleData) {
    @Previewable @Query(sort: \TodoTask.title) var todoTasks: [TodoTask]
    NavigationStack {
        TaskDetailView(todoTask: todoTasks[0])
    }
}
