//
//  TaskListView.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//
import SwiftUI
import SwiftData

struct TaskListView: View {
    @Query(sort: \TodoTask.sortIndex) private var todoTasks: [TodoTask]
    @State private var showAddTaskSheet: Bool = false
    @Environment(\.modelContext) private var context: ModelContext
   
    var body: some View {
        NavigationStack {
            List {
                ForEach(todoTasks) { task in
                        NavigationLink(destination: TaskDetailView(todoTask: task)) {
                               VStack(alignment: .leading) {
                                    Text(task.title)
                                    Text(task.priority.name)
                                        .font(.caption)
                               }
                        
                                
//                            Toggle(isOn: task.isCompleted) {
//                                VStack(alignment: .leading) {
//                                    Text(task.title)
//                                    Text(task.priority.name)
//                                        .font(.caption)
//                                }
//                        }
                    }
                }
                .onMove(perform: move)
                .onDelete { indexSet in
                    for index in indexSet {
                        let task = todoTasks[index]
                        context.delete(task)
                    }
                    try? context.save()
                }
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
                    TaskFormView(todoTask: nil)
                        .navigationTitle(Text("New Task"))
                }
            }
        }
    }
    private func move(from offsets: IndexSet,to destination: Int) {
        var items = todoTasks
        
        items.move(fromOffsets: offsets, toOffset: destination)
        
        for (index, item) in items.enumerated() {
            if (item.sortIndex != index) {
                item.sortIndex = index
            }
        }
    }
}

#Preview {
    TaskListView()
        .modelContainer(for: TodoTask.self)
}

