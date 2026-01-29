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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    @Previewable @State var task = TodoTask.sample[0]
    TaskFormView(todoTask: $task)
}
