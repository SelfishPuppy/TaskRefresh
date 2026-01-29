//
//  DetailView.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var todoTask: TodoTask
    @State private var showEditTaskSheet = false
    @State private var editingTodoTask = TodoTask.emptyTask
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
                    Toggle(isOn: $todoTask.isCompleted) {
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
                TaskFormView(todoTask: $editingTodoTask)
                    .navigationTitle(todoTask.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showEditTaskSheet = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                showEditTaskSheet = false
                                todoTask = editingTodoTask
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    @Previewable @State var todoTask = TodoTask.sample[0]
    NavigationStack {
        TaskDetailView(todoTask: $todoTask)
    }
}
