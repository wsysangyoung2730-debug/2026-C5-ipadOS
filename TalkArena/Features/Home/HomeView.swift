import SwiftUI

struct HomeView: View {
    @State private var selectedMode: AppMode? = .challenge

    var body: some View {
        NavigationSplitView {
            List(AppMode.allCases, selection: $selectedMode) { mode in
                Label(mode.title, systemImage: mode.systemImage)
                    .tag(mode)
            }
            .navigationTitle("Talk Arena")
        } detail: {
            switch selectedMode {
            case .challenge:
                ChallengeView()
            case .practice:
                PracticeView()
            case .none:
                ContentUnavailableView(
                    "모드를 선택하세요",
                    systemImage: "bubble.left.and.bubble.right",
                    description: Text("Challenge Mode 또는 Practice Mode를 선택해 대화를 연습합니다.")
                )
            }
        }
    }
}

#Preview {
    HomeView()
}

