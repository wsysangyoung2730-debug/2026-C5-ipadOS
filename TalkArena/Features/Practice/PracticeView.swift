import SwiftUI

struct PracticeView: View {
    var body: some View {
        ContentUnavailableView(
            "Practice Mode 준비 중",
            systemImage: "mic.circle",
            description: Text("내 상황을 설정하고 음성으로 대화를 리허설하는 모드입니다.")
        )
        .navigationTitle("Practice Mode")
    }
}

#Preview {
    PracticeView()
}

