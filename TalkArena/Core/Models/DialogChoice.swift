import Foundation

struct DialogChoice: Identifiable, Hashable {
    let id: UUID
    let text: String
    let strategy: DialogStrategy

    init(
        id: UUID = UUID(),
        text: String,
        strategy: DialogStrategy
    ) {
        self.id = id
        self.text = text
        self.strategy = strategy
    }
}

enum DialogStrategy: String, CaseIterable {
    case direct
    case empathy
    case question
    case solution

    var title: String {
        switch self {
        case .direct:
            "직설적으로 말하기"
        case .empathy:
            "감정 먼저 인정하기"
        case .question:
            "질문으로 풀기"
        case .solution:
            "해결책 제안하기"
        }
    }
}

