import SwiftUI

struct HomeView: View {
    @State private var selectedMode: AppMode = .challenge

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [TalkArenaColor.warmIvory, TalkArenaColor.softBlue.opacity(0.48)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            HStack(spacing: 22) {
                ArenaSidebar(selectedMode: $selectedMode)

                Group {
                    switch selectedMode {
                    case .challenge:
                        ChallengeView()
                    case .practice:
                        PracticeView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(20)
        }
    }
}

#Preview {
    HomeView()
}
