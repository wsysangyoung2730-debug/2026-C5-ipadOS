import SwiftUI

struct ConversationBoard: View {
    private let choices = DialogChoice.samples

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("대화")
                .font(.title2.bold())

            VStack(alignment: .leading, spacing: 12) {
                Text("팀원 A")
                    .font(.caption.bold())
                    .foregroundStyle(.secondary)

                Text("지금 이 상황이 전부 제 탓은 아니잖아요. 외부 요청이 계속 바뀌었어요.")
                    .font(.title3)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 20))

            Text("어떻게 답할까요?")
                .font(.headline)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(choices) { choice in
                    ChoiceCard(choice: choice)
                }
            }

            Spacer()
        }
        .padding()
    }
}

