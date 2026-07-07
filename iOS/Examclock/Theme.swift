import SwiftUI

/// Bespoke palette for Examclock: Countdown to every upcoming exam with days-left and prep checklist per test.
enum Theme {
    static let accent = Color(red: 0.886, green: 0.243, blue: 0.341)
    static let background = Color(red: 0.086, green: 0.027, blue: 0.035)
    static let card = Color(red: 0.149, green: 0.059, blue: 0.075)
    static let ink = Color(white: 0.95)
    static let mutedInk = Color(white: 0.65)

    static func titleFont(_ size: CGFloat = 28) -> Font {
        .system(size: size, weight: .bold, design: .serif)
    }
    static func bodyFont(_ size: CGFloat = 16) -> Font {
        .system(size: size, weight: .regular, design: .serif)
    }
    static func labelFont(_ size: CGFloat = 13) -> Font {
        .system(size: size, weight: .semibold, design: .serif)
    }

    static let cornerRadius: CGFloat = 18
}
