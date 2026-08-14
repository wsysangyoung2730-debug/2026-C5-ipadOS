import SwiftUI

struct ChallengeResultView: View {
    let restartAction: () -> Void

    var body: some View {
        ZStack {
            IllustratedStageView(characterMood: .relieved)

            HStack {
                Spacer()

                VStack(alignment: .leading, spacing: 24) {
                    Text("챌린지 클리어")
                        .font(.headline)
                        .foregroundStyle(TalkArenaColor.arenaPurple)

                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text("A")
                            .font(.system(size: 92, weight: .heavy, design: .rounded))
                            .foregroundStyle(TalkArenaColor.arenaPurple)
                        Text("전략적 경청자")
                            .font(.largeTitle.bold())
                            .foregroundStyle(TalkArenaColor.ink)
                    }

                    VStack(spacing: 12) {
                        ResultMeter(title: "신뢰 형성", score: 88, color: TalkArenaColor.trustGreen)
                        ResultMeter(title: "긴장 조절", score: 74, color: TalkArenaColor.warningOrange)
                        ResultMeter(title: "목표 달성", score: 91, color: TalkArenaColor.arenaPurple)
                    }

                    Text("감정을 먼저 다루는 선택이 좋았어요. 다음 플레이에서는 구체적인 합의 기준을 더 빠르게 꺼내면 점수가 더 올라갈 수 있어요.")
                        .font(.title3)
                        .foregroundStyle(TalkArenaColor.mutedInk)
                        .lineSpacing(6)

                    HStack(spacing: 14) {
                        ArenaButton("다시 도전하기", systemImage: "arrow.clockwise", action: restartAction)

                        Button("더 어려운 상황") {}
                            .font(.headline)
                            .foregroundStyle(TalkArenaColor.arenaPurple)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 15)
                            .background(.white)
                            .clipShape(Capsule())
                    }
                }
                .padding(34)
                .frame(width: 560, alignment: .leading)
                .background(.white.opacity(0.92))
                .clipShape(RoundedRectangle(cornerRadius: 36))
                .shadow(color: .black.opacity(0.16), radius: 28, x: 0, y: 16)
            }
            .padding(42)
        }
    }
}

private struct ResultMeter: View {
    let title: String
    let score: Int
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Text("\(score)")
                    .font(.headline.bold())
            }
            .foregroundStyle(TalkArenaColor.ink)

            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(color.opacity(0.14))
                    Capsule()
                        .fill(color)
                        .frame(width: proxy.size.width * CGFloat(score) / 100)
                }
            }
            .frame(height: 10)
        }
    }
}

