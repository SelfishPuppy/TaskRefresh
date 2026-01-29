//
//  TaskRefreshApp.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//

import SwiftUI
import SwiftData

@main
struct TaskRefreshApp: App {
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
        .modelContainer(for: TodoTask.self)
    }
}
