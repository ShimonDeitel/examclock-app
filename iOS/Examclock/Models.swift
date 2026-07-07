import Foundation

struct ExamclockItem: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var title: String
    var category: String
    var value: Double
    var date: Date = Date()
    var notes: String = ""
    var isResolved: Bool = false
}

enum ExamclockCategory: String, CaseIterable, Codable {
        case midterm = "Midterm"
    case final = "Final"
    case quiz = "Quiz"
    case standardizedtest = "Standardized Test"
}
