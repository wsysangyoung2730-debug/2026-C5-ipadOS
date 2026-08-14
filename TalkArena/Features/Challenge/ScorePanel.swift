import SwiftUI

struct ScorePanel: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("평가")
                .font(.title2.bold())

            ScoreRow(title: "신뢰도", value: "+8")
            ScoreRow(title: "긴장도", value: "-5")
            ScoreRow(title: "목표 달성도", value: "+10")

            Divider()

            Text("턴 피드백")
                .font(.headline)

            Text("상대의 감정을 먼저 확인한 점은 좋았습니다. 다음 턴에서는 구체적인 합의 기준을 제안해보세요.")
                .foregroundStyle(.secondary)

            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}

