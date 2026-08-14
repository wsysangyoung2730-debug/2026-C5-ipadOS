import SwiftUI

struct ArenaButton: View {
    let title: String
    let systemImage: String?
    let action: () -> Void

    init(
        _ title: String,
        systemImage: String? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.systemImage = systemImage
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                if let systemImage {
                    Image(systemName: systemImage)
                }

                Text(title)
                    .font(.headline)
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 26)
            .padding(.vertical, 16)
            .background(
                LinearGradient(
                    colors: [TalkArenaColor.arenaPurpleLight, TalkArenaColor.arenaPurple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(Capsule())
            .shadow(color: TalkArenaColor.arenaPurple.opacity(0.34), radius: 18, x: 0, y: 10)
        }
        .buttonStyle(.plain)
    }
}

