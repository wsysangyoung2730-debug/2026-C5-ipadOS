import Foundation

struct Scenario: Identifiable, Hashable {
    let id: UUID
    let title: String
    let description: String
    let characters: [CharacterProfile]

    init(
        id: UUID = UUID(),
        title: String,
        description: String,
        characters: [CharacterProfile]
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.characters = characters
    }
}

