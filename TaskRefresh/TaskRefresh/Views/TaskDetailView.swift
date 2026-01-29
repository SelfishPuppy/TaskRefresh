//
//  DetailView.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//

import SwiftUI

struct TaskDetailView: View {
    @Binding var todoTask: TodoTask
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("Title")
                    Spacer()
                    
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var todoTask = TodoTask.sample[0]
    TaskDetailView(todoTask: $todoTask)
}
