import Foundation

struct CharacterProfile: Identifiable, Hashable {
    let id: UUID
    let name: String
    let role: String
    let personality: String
    let currentEmotion: String

    init(
        id: UUID = UUID(),
        name: String,
        role: String,
        personality: String,
        currentEmotion: String
    ) {
        self.id = id
        self.name = name
        self.role = role
        self.personality = personality
        self.currentEmotion = currentEmotion
    }
}

