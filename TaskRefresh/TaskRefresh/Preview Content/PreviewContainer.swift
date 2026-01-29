//
//  PreviewContainer.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 29.01.2026.
//

import SwiftData
import SwiftUI

struct TaskSampleData: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try ModelContainer(for: TodoTask.self, configurations: .init(isStoredInMemoryOnly: true))
        TodoTask.sample.forEach{ container.mainContext.insert($0) }
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var taskSampleData: Self = .modifier(TaskSampleData())
}
