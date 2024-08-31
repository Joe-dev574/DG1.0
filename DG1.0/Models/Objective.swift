//
//  Objective.swift
//  DG1.0
//
//  Created by Joseph DeWeese on 8/31/24.
//

import SwiftUI
import SwiftData

@Model
class Objective {
    var title: String
    var remarks: String
    var dateAdded: Date
    var targetDate: Date
    var dateCompleted: Date
    var priority: Int?
    var status: Status.RawValue
    var assignedTo: String = ""
    var isCompleted: Bool = false
    @Relationship(deleteRule: .cascade)
    var notes: [Note]?
    var tint: String
    
    var target: DailyTarget?
    
    
    init(
        title: String,
        remarks: String,
        dateAdded: Date = Date.now,
        targetDate: Date = Date.distantPast,
        dateCompleted: Date = Date.distantPast,
        priority: Int? = nil,
        status: Status = .active,
        assignedTo: String = "",
        tint: String
    ) {
        self.title = title
        self.remarks = remarks
        self.dateAdded = dateAdded
        self.targetDate = targetDate
        self.dateCompleted = dateCompleted
        self.priority = priority
        self.status = status.rawValue
        self.assignedTo = assignedTo
        self.tint = tint
    }
    var icon: Image {
        switch Status(rawValue: status)! {
        case .planning:
            Image(systemName: "calendar.badge.clock")
        case .active:
            Image(systemName: "hourglass.circle")
        case .completed:
            Image(systemName: "checkmark.seal")
        case .hold:
            Image(systemName: "exclamationmark.circle")
        }
    }
    var tintColor: Color {
        switch tint {
        case "TaskColor 1": return .taskColor1
        case "TaskColor 2": return .taskColor2
        case "TaskColor 3": return .taskColor3
        case "TaskColor 4": return .taskColor4
        case "TaskColor 5": return .taskColor5
        case "TaskColor 6": return .taskColor6
        case "TaskColor 7": return .taskColor7
        case "TaskColor 8": return .taskColor8
        case "TaskColor 9": return .taskColor9
        case "TaskColor 10": return .taskColor10
        case "TaskColor 11": return .taskColor11
        default: return .black
        }
    }
}
///TODO:  create custom icons for icon
enum Status: Int, Codable, Identifiable, CaseIterable {
    case planning,active, completed, hold
    var id: Self {
        self
    }
    var descr: String {
        switch self {
        case .planning:
            "Planning"
        case .active:
            "Active"
        case .completed:
            "Completed"
        case .hold:
            "Hold"
        }
    }
}

