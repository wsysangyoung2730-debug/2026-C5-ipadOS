import Foundation

enum AppMode: String, CaseIterable, Identifiable {
    case challenge
    case practice

    var id: String { rawValue }

    var title: String {
        switch self {
        case .challenge:
            "Challenge Mode"
        case .practice:
            "Practice Mode"
        }
    }

    var systemImage: String {
        switch self {
        case .challenge:
            "gamecontroller"
        case .practice:
            "mic"
        }
    }
}

