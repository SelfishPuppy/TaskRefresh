//
//  Priority.swift
//  TaskRefresh
//
//  Created by Maxym Tyshchenko on 29.01.2026.
//

public enum Priority: String, CaseIterable, Identifiable, Codable {
    case low, medium, high
    
    public var name: String {
        self.rawValue
    }
    public var id: String {
        name
    }
   
}
