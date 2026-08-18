import SwiftUI

struct HomeView: View {
    @State private var selectedMode: AppMode = .challenge
    @State private var selectedDestination: HomeDestination = .home

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

                VStack(spacing: 18) {
                    HomeTopBar(
                        selectedDestination: $selectedDestination,
                        selectedMode: selectedMode
                    )

                    Group {
                        switch selectedDestination {
                        case .home:
                            switch selectedMode {
                            case .challenge:
                                ChallengeView()
                            case .practice:
                                PracticeView()
                            }
                        case .profile:
                            ProfileView()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(20)
        }
    }
}

private enum HomeDestination: String, CaseIterable, Identifiable {
    case home
    case profile

    var id: String { rawValue }

    var title: String {
        switch self {
        case .home:
            "홈"
        case .profile:
            "내 프로필"
        }
    }

    var systemImage: String {
        switch self {
        case .home:
            "house.fill"
        case .profile:
            "person.crop.circle.fill"
        }
    }
}

private struct HomeTopBar: View {
    @Binding var selectedDestination: HomeDestination
    let selectedMode: AppMode

    var body: some View {
        HStack(spacing: 18) {
            VStack(alignment: .leading, spacing: 5) {
                Text(selectedDestination == .home ? selectedMode.title : "Profile")
                    .font(.caption.bold())
                    .foregroundStyle(TalkArenaColor.arenaPurple)

                Text(selectedDestination == .home ? selectedMode.subtitle : "나에게 맞는 대화 연습 환경을 설정합니다.")
                    .font(.headline)
                    .foregroundStyle(TalkArenaColor.ink)
            }

            Spacer()

            HStack(spacing: 8) {
                ForEach(HomeDestination.allCases) { destination in
                    topButton(for: destination)
                }
            }
            .padding(6)
            .background(.white.opacity(0.74))
            .clipShape(Capsule())

            Button {
                selectedDestination = .profile
            } label: {
                HStack(spacing: 10) {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [TalkArenaColor.arenaPurpleLight, TalkArenaColor.neonMint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 36, height: 36)
                        .overlay {
                            Text("나")
                                .font(.caption.bold())
                                .foregroundStyle(.white)
                        }

                    VStack(alignment: .leading, spacing: 2) {
                        Text("플레이어")
                            .font(.headline)
                            .foregroundStyle(TalkArenaColor.ink)
                        Text("목표 설정")
                            .font(.caption.bold())
                            .foregroundStyle(TalkArenaColor.mutedInk)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(.white.opacity(0.82))
                .clipShape(Capsule())
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .shadow(color: .black.opacity(0.08), radius: 18, x: 0, y: 10)
    }

    private func topButton(for destination: HomeDestination) -> some View {
        Button {
            selectedDestination = destination
        } label: {
            Label(destination.title, systemImage: destination.systemImage)
                .font(.headline)
                .foregroundStyle(selectedDestination == destination ? .white : TalkArenaColor.mutedInk)
                .padding(.horizontal, 18)
                .padding(.vertical, 11)
                .background(selectedDestination == destination ? TalkArenaColor.arenaPurple : .clear)
                .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HomeView()
}
