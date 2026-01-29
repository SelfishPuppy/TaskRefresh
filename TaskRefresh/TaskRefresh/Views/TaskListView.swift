//
//  TaskListView.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//
import SwiftUI

struct TaskListView: View {
    @State private var model: [TodoTask] = TodoTask.sample
    @State private var showAddTaskSheet: Bool = false
    @State private var emptyTask = TodoTask.emptyTask
    var body: some View {
        NavigationStack {
            List {
                ForEach($model) { $task in
                        NavigationLink(destination: TaskDetailView(todoTask: $task)) {
                                
                            Toggle(isOn: $task.isCompleted) {
                                VStack(alignment: .leading) {
                                    Text(task.title)
                                    Text(task.priority.name)
                                        .font(.caption)
                                }
                        }
                    }
                }
                .onMove(perform: move)
                .onDelete(perform: { indexSet in
                        model.remove(atOffsets: indexSet)
                })
            }
            .toolbar {
                Button {
                    showAddTaskSheet = true
                } label: {
                    Image(systemName: "plus")
                }
                EditButton()
            }
            .sheet(isPresented: $showAddTaskSheet) {
                NavigationStack {
                    TaskFormView(todoTask: $emptyTask)
                        .navigationTitle(Text("New Task"))
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    showAddTaskSheet = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    let newTask = TodoTask(title: emptyTask.title, isCompleted: false, dueDate: Date(), priority: emptyTask.priority)
                                    
                                    showAddTaskSheet = false
                                    
                                    emptyTask.title = ""
                                    emptyTask.isCompleted = false
                                    emptyTask.priority = .low
                                    emptyTask.dueDate = Date()
                                    
                                    model.append(newTask)
                                }
                            }
                        }
                }
            }
        }
    }
    private func move(from offsets: IndexSet,to destination: Int) {
        model.move(fromOffsets: offsets, toOffset: destination)
    }
}

#Preview {
    TaskListView()
}
