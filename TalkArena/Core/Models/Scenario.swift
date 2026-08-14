import Foundation

struct Scenario: Identifiable, Hashable {
    let id: UUID
    let title: String
    let missionTitle: String
    let description: String
    let openingLine: String
    let difficulty: String
    let estimatedMinutes: Int
    let tags: [String]
    let characters: [CharacterProfile]

    init(
        id: UUID = UUID(),
        title: String,
        missionTitle: String,
        description: String,
        openingLine: String,
        difficulty: String,
        estimatedMinutes: Int,
        tags: [String],
        characters: [CharacterProfile]
    ) {
        self.id = id
        self.title = title
        self.missionTitle = missionTitle
        self.description = description
        self.openingLine = openingLine
        self.difficulty = difficulty
        self.estimatedMinutes = estimatedMinutes
        self.tags = tags
        self.characters = characters
    }
}
