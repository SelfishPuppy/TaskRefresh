//
//  TodoTask+sample.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 28.01.2026.
//

import Foundation

extension TodoTask {
    static var sample: [TodoTask] = [
        TodoTask(title: "Sample task", isCompleted: false, sortIndex: 0),
        TodoTask(title: "Another sample task", isCompleted: true,sortIndex: 1),
        TodoTask(title: "Yet another sample task", isCompleted: false,sortIndex: 2)
    ]
}
