import SwiftUI

struct TurnFeedbackView: View {
    let retryAction: () -> Void
    let nextAction: () -> Void

    var body: some View {
        ZStack {
            IllustratedStageView(characterMood: .confident)
                .overlay(.black.opacity(0.28))

            VStack(spacing: 22) {
                Text("턴 결과")
                    .font(.system(size: 44, weight: .heavy, design: .rounded))
                    .foregroundStyle(TalkArenaColor.ink)

                HStack(spacing: 12) {
                    scoreChip("신뢰도 +8", color: TalkArenaColor.trustGreen)
                    scoreChip("긴장도 -5", color: TalkArenaColor.warningOrange)
                    scoreChip("목표 진행 +10", color: TalkArenaColor.arenaPurple)
                }

                VStack(alignment: .leading, spacing: 18) {
                    FeedbackRow(
                        icon: "hand.thumbsup.fill",
                        title: "좋았던 점",
                        body: "상대의 감정을 먼저 인정해서 방어적인 분위기를 낮췄어요."
                    )
                    FeedbackRow(
                        icon: "exclamationmark.bubble.fill",
                        title: "오해될 수 있는 지점",
                        body: "아직 다음 행동이 구체적이지 않아 회의가 다시 흐려질 수 있어요."
                    )
                    FeedbackRow(
                        icon: "sparkles",
                        title: "다음 턴 힌트",
                        body: "감정을 인정한 뒤, 일정 기준이나 확인할 사실을 하나만 제안해보세요."
                    )
                }
                .padding(26)
                .background(TalkArenaColor.warmIvory)
                .clipShape(RoundedRectangle(cornerRadius: 28))

                HStack(spacing: 14) {
                    Button("다른 말 고르기", action: retryAction)
                        .font(.headline)
                        .foregroundStyle(TalkArenaColor.arenaPurple)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 15)
                        .background(TalkArenaColor.arenaPurple.opacity(0.10))
                        .clipShape(Capsule())

                    ArenaButton("다음 턴", systemImage: "arrow.right", action: nextAction)
                }
            }
            .padding(34)
            .frame(maxWidth: 680)
            .background(.white.opacity(0.92))
            .clipShape(RoundedRectangle(cornerRadius: 36))
            .shadow(color: .black.opacity(0.20), radius: 30, x: 0, y: 18)
        }
    }

    private func scoreChip(_ title: String, color: Color) -> some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(color)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
    }
}

private struct FeedbackRow: View {
    let icon: String
    let title: String
    let body: String

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundStyle(TalkArenaColor.arenaPurple)
                .frame(width: 28)

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(TalkArenaColor.ink)
                Text(body)
                    .font(.body)
                    .foregroundStyle(TalkArenaColor.mutedInk)
            }
        }
    }
}

