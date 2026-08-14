import SwiftUI

struct DialogueSceneView: View {
    private let choices = DialogChoice.samples
    let selectAction: () -> Void

    var body: some View {
        ZStack {
            IllustratedStageView(characterMood: .tense)

            VStack {
                HStack(alignment: .top) {
                    missionBadge

                    Spacer()

                    liveStats
                }
                .padding(30)

                Spacer()

                DialogueBox(
                    speaker: "팀원 A",
                    line: "이게 전부 제 잘못은 아니잖아요. 외부 요청이 계속 바뀌었다고요."
                )
                .padding(.horizontal, 34)

                VStack(alignment: .leading, spacing: 14) {
                    Text("어떤 전략으로 답할까?")
                        .font(.headline)
                        .foregroundStyle(.white.opacity(0.88))
                        .padding(.leading, 6)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                        ForEach(choices) { choice in
                            StrategyChoiceButton(choice: choice) {
                                selectAction()
                            }
                        }
                    }
                }
                .padding(28)
                .background(.black.opacity(0.26))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding(34)
            }
        }
    }

    private var missionBadge: some View {
        HStack(spacing: 10) {
            Image(systemName: "flag.fill")
            Text("턴 4 / 12 · 회의 갈등")
        }
        .font(.headline)
        .foregroundStyle(.white)
        .padding(.horizontal, 18)
        .padding(.vertical, 12)
        .background(.black.opacity(0.28))
        .clipShape(Capsule())
    }

    private var liveStats: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("상황 게이지")
                .font(.headline)
                .foregroundStyle(TalkArenaColor.ink)

            StatMeter(title: "신뢰도", value: 0.72, color: TalkArenaColor.trustGreen)
            StatMeter(title: "긴장도", value: 0.58, color: TalkArenaColor.warningOrange)
            StatMeter(title: "목표 진행", value: 0.36, color: TalkArenaColor.arenaPurple)
        }
        .padding(20)
        .frame(width: 250)
        .background(.white.opacity(0.88))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.10), radius: 16, x: 0, y: 10)
    }
}

private struct StrategyChoiceButton: View {
    let choice: DialogChoice
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(choice.strategy.title)
                        .font(.caption.bold())
                        .foregroundStyle(TalkArenaColor.arenaPurple)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(TalkArenaColor.arenaPurple.opacity(0.10))
                        .clipShape(Capsule())

                    Text(choice.text)
                        .font(.headline)
                        .foregroundStyle(TalkArenaColor.ink)
                        .multilineTextAlignment(.leading)
                }

                Spacer()

                Image(systemName: "arrow.right.circle.fill")
                    .font(.title)
                    .foregroundStyle(TalkArenaColor.arenaPurple)
            }
            .padding(20)
            .frame(minHeight: 106)
            .background(.white.opacity(0.94))
            .clipShape(RoundedRectangle(cornerRadius: 22))
            .shadow(color: .black.opacity(0.10), radius: 12, x: 0, y: 8)
        }
        .buttonStyle(.plain)
    }
}

private struct StatMeter: View {
    let title: String
    let value: Double
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            HStack {
                Text(title)
                Spacer()
                Text("\(Int(value * 100))%")
            }
            .font(.caption.bold())
            .foregroundStyle(TalkArenaColor.mutedInk)

            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(color.opacity(0.16))
                    Capsule()
                        .fill(color)
                        .frame(width: proxy.size.width * value)
                }
            }
            .frame(height: 8)
        }
    }
}

