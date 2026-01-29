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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($model) { $task in
                        NavigationLink(destination: TaskDetailView()) {
                                
                            Toggle(isOn: $task.isCompleted) {
                                VStack(alignment: .leading) {
                                    Text(task.title)
                                    Text(task.priority.description())
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
                    showAddTaskSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                EditButton()
            }
            .sheet(isPresented: $showAddTaskSheet) {
                TaskFormView()
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
