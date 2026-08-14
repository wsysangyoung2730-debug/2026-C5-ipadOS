import SwiftUI

struct ChallengeIntroView: View {
    let scenario: Scenario
    let startAction: () -> Void

    var body: some View {
        ZStack {
            IllustratedStageView(characterMood: .confident)

            VStack(spacing: 26) {
                Spacer()

                VStack(spacing: 22) {
                    Label("미션 브리핑", systemImage: "flag.fill")
                        .font(.headline)
                        .foregroundStyle(TalkArenaColor.arenaPurple)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(TalkArenaColor.arenaPurple.opacity(0.10))
                        .clipShape(Capsule())

                    VStack(spacing: 16) {
                        Text("책임 떠넘기기")
                            .font(.system(size: 46, weight: .heavy, design: .rounded))
                            .foregroundStyle(TalkArenaColor.ink)

                        Text(scenario.description)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(TalkArenaColor.mutedInk)
                            .lineSpacing(6)
                            .frame(maxWidth: 760)
                    }

                    HStack(spacing: 14) {
                        traitChip("감정 인정")
                        traitChip("책임 조율")
                        traitChip("긴장 높음")
                    }

                    HStack(spacing: 16) {
                        ForEach(scenario.characters) { character in
                            MiniCharacterCard(character: character)
                        }
                    }

                    ArenaButton("대화 시작하기", systemImage: "arrow.right") {
                        startAction()
                    }
                    .padding(.top, 10)
                }
                .padding(34)
                .frame(maxWidth: 900)
                .background(.white.opacity(0.88))
                .clipShape(RoundedRectangle(cornerRadius: 34))
                .shadow(color: TalkArenaColor.arenaPurple.opacity(0.18), radius: 28, x: 0, y: 18)

                Spacer()
            }
            .padding(42)
        }
    }

    private func traitChip(_ title: String) -> some View {
        Text(title)
            .font(.caption.bold())
            .foregroundStyle(TalkArenaColor.arenaPurple)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(TalkArenaColor.arenaPurple.opacity(0.10))
            .clipShape(Capsule())
    }
}

private struct MiniCharacterCard: View {
    let character: CharacterProfile

    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [TalkArenaColor.neonMint, TalkArenaColor.softBlue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: "person.fill")
                        .foregroundStyle(TalkArenaColor.ink.opacity(0.72))
                }

            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.headline)
                    .foregroundStyle(TalkArenaColor.ink)
                Text(character.currentEmotion)
                    .font(.caption.bold())
                    .foregroundStyle(TalkArenaColor.dangerPink)
            }
        }
        .padding(16)
        .frame(width: 210, alignment: .leading)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.08), radius: 14, x: 0, y: 8)
    }
}

