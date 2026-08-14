import SwiftUI

struct DialogueBox: View {
    let speaker: String
    let line: String

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text(speaker)
                .font(.title2.bold())
                .foregroundStyle(.white)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background(TalkArenaColor.arenaPurple)
                .clipShape(Capsule())
                .shadow(color: TalkArenaColor.arenaPurple.opacity(0.36), radius: 12, x: 0, y: 8)

            Text(line)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
                .lineSpacing(8)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.title3.bold())
                    .foregroundStyle(.white.opacity(0.88))
            }
        }
        .padding(28)
        .background(
            LinearGradient(
                colors: [
                    TalkArenaColor.arenaPurple.opacity(0.90),
                    Color(red: 0.38, green: 0.07, blue: 0.63).opacity(0.88)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .overlay {
            RoundedRectangle(cornerRadius: 28)
                .stroke(.white.opacity(0.25), lineWidth: 2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .shadow(color: TalkArenaColor.arenaPurple.opacity(0.42), radius: 22, x: 0, y: 14)
    }
}

