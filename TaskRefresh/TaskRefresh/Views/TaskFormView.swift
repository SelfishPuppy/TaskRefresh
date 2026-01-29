//
//  TaskFormView.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//

import SwiftUI

struct TaskFormView: View {
    @Binding var todoTask: TodoTask
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $todoTask.title)
                Picker("Priority", selection: $todoTask.priority) {
                    ForEach(Priority.allCases) { priority in
                            Text(priority.rawValue).tag(priority)
                    }
                }
                DatePicker("Due Date", selection: $todoTask.dueDate, displayedComponents: [.date])
                Toggle(isOn: $todoTask.isCompleted) {
                    Text("Completed")
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var task = TodoTask.sample[0]
    TaskFormView(todoTask: $task)
}
