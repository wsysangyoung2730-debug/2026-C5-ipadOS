import SwiftUI

struct PracticeView: View {
    var body: some View {
        ZStack {
            IllustratedStageView(characterMood: .confident)

            VStack(alignment: .leading, spacing: 22) {
                Spacer()

                VStack(alignment: .leading, spacing: 14) {
                    Label("Practice Mode", systemImage: "mic.fill")
                        .font(.headline)
                        .foregroundStyle(TalkArenaColor.arenaPurple)

                    Text("내 상황을 직접 만들고, 음성으로 대화 리허설하기")
                        .font(.largeTitle.bold())
                        .foregroundStyle(TalkArenaColor.ink)

                    Text("관계, 상대 성향, 목표를 설정하면 AI 상대가 반응하고 대화 후 개선점과 대안 표현을 제안합니다.")
                        .font(.title3)
                        .foregroundStyle(TalkArenaColor.mutedInk)
                        .frame(maxWidth: 720, alignment: .leading)

                    ArenaButton("상황 만들기", systemImage: "mic.badge.plus")
                }
                .padding(34)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .shadow(color: .black.opacity(0.12), radius: 24, x: 0, y: 14)
            }
            .padding(38)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    PracticeView()
}
