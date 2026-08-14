import SwiftUI

struct ChoiceCard: View {
    let choice: DialogChoice

    var body: some View {
        Button {
            // TODO: 선택지에 따른 AI 반응과 점수 계산을 연결합니다.
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Text(choice.strategy.title)
                    .font(.caption.bold())
                    .foregroundStyle(.purple)

                Text(choice.text)
                    .font(.body)
                    .foregroundStyle(.primary)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .buttonStyle(.plain)
    }
}

