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

    var koreanTitle: String {
        switch self {
        case .challenge:
            "챌린지"
        case .practice:
            "연습"
        }
    }

    var subtitle: String {
        switch self {
        case .challenge:
            "상황 카드를 깨며 대화 전략을 겨루는 선택형 게임"
        case .practice:
            "내 실제 상황을 설정하고 음성으로 리허설하는 모드"
        }
    }
}
