import SwiftUI

struct CharacterCard: View {
    let character: CharacterProfile

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(character.name)
                .font(.headline)

            Text(character.role)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(character.personality)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(character.currentEmotion)
                .font(.caption.bold())
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.orange.opacity(0.16))
                .clipShape(Capsule())
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

