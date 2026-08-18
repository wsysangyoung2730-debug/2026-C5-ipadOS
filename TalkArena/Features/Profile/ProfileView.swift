import SwiftUI

struct ProfileView: View {
    @State private var nickname = "플레이어"
    @State private var goal = "어려운 대화를 덜 부담스럽게 연습하기"
    @State private var selectedMode = "챌린지 중심"
    @State private var selectedTone = "부드럽지만 명확하게"

    private let modes = ["챌린지 중심", "현실 연습 중심", "둘 다 균형 있게"]
    private let tones = ["부드럽지만 명확하게", "직설적으로", "공감 먼저", "질문으로 풀기"]

    var body: some View {
        ZStack {
            IllustratedStageView(characterMood: .confident)
                .overlay(.white.opacity(0.18))

            HStack(spacing: 24) {
                profileSummary
                profileSettings
            }
            .padding(34)
        }
    }

    private var profileSummary: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 14) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [TalkArenaColor.arenaPurple, TalkArenaColor.neonMint],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 110, height: 110)

                    Text("나")
                        .font(.system(size: 36, weight: .heavy, design: .rounded))
                        .foregroundStyle(.white)
                }

                Text(nickname)
                    .font(.system(size: 38, weight: .heavy, design: .rounded))
                    .foregroundStyle(TalkArenaColor.ink)

                Text(goal)
                    .font(.title3)
                    .foregroundStyle(TalkArenaColor.mutedInk)
                    .lineSpacing(6)
            }

            Divider()

            VStack(alignment: .leading, spacing: 16) {
                ProfileStatCard(title: "이번 주 연습", value: "0회", systemImage: "calendar.badge.clock")
                ProfileStatCard(title: "선호 플레이", value: selectedMode, systemImage: "gamecontroller.fill")
                ProfileStatCard(title: "대화 톤", value: selectedTone, systemImage: "bubble.left.and.text.bubble.right.fill")
            }

            Spacer()
	        }
	        .padding(30)
	        .frame(width: 360)
	        .frame(maxHeight: .infinity, alignment: .topLeading)
	        .background(.white.opacity(0.90))
        .clipShape(RoundedRectangle(cornerRadius: 34))
        .shadow(color: .black.opacity(0.12), radius: 24, x: 0, y: 14)
    }

    private var profileSettings: some View {
        VStack(alignment: .leading, spacing: 22) {
            VStack(alignment: .leading, spacing: 8) {
                Text("내 프로필 설정")
                    .font(.system(size: 42, weight: .heavy, design: .rounded))
                    .foregroundStyle(TalkArenaColor.ink)

                Text("대화 시뮬레이션이 나에게 맞게 느껴지도록 기본 목표와 연습 성향을 설정합니다.")
                    .font(.title3)
                    .foregroundStyle(TalkArenaColor.mutedInk)
            }

            ProfileInputSection(title: "닉네임") {
                TextField("닉네임을 입력하세요", text: $nickname)
                    .textFieldStyle(.plain)
                    .font(.title3.bold())
                    .padding(18)
                    .background(TalkArenaColor.warmIvory)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }

            ProfileInputSection(title: "내 대화 연습 목표") {
                TextField("연습 목표를 입력하세요", text: $goal, axis: .vertical)
                    .textFieldStyle(.plain)
                    .font(.body)
                    .lineLimit(2...4)
                    .padding(18)
                    .background(TalkArenaColor.warmIvory)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }

            ProfileInputSection(title: "선호 연습 방식") {
                ProfileChipPicker(options: modes, selectedOption: $selectedMode)
            }

            ProfileInputSection(title: "연습하고 싶은 대화 톤") {
                ProfileChipPicker(options: tones, selectedOption: $selectedTone)
            }

            Spacer()

            HStack {
                Label("이 설정은 이후 AI 피드백과 추천 미션에 연결할 예정입니다.", systemImage: "sparkles")
                    .font(.callout.bold())
                    .foregroundStyle(TalkArenaColor.arenaPurple)

                Spacer()

                ArenaButton("저장하기", systemImage: "checkmark")
            }
            .padding(20)
            .background(.white.opacity(0.72))
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .padding(34)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 34))
    }
}

private struct ProfileInputSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundStyle(TalkArenaColor.ink)

            content
        }
    }
}

private struct ProfileChipPicker: View {
    let options: [String]
    @Binding var selectedOption: String

    var body: some View {
        FlowLayout(spacing: 10) {
            ForEach(options, id: \.self) { option in
                Button {
                    selectedOption = option
                } label: {
                    Text(option)
                        .font(.headline)
                        .foregroundStyle(selectedOption == option ? .white : TalkArenaColor.mutedInk)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 11)
                        .background(selectedOption == option ? TalkArenaColor.arenaPurple : .white.opacity(0.82))
                        .clipShape(Capsule())
                }
                .buttonStyle(.plain)
            }
        }
    }
}

private struct ProfileStatCard: View {
    let title: String
    let value: String
    let systemImage: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: systemImage)
                .font(.headline)
                .foregroundStyle(TalkArenaColor.arenaPurple)
                .frame(width: 34, height: 34)
                .background(TalkArenaColor.arenaPurple.opacity(0.10))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.caption.bold())
                    .foregroundStyle(TalkArenaColor.mutedInk)
                Text(value)
                    .font(.headline)
                    .foregroundStyle(TalkArenaColor.ink)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(TalkArenaColor.warmIvory)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

private struct FlowLayout<Content: View>: View {
    let spacing: CGFloat
    @ViewBuilder let content: Content

    init(spacing: CGFloat = 8, @ViewBuilder content: () -> Content) {
        self.spacing = spacing
        self.content = content()
    }

    var body: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 150), spacing: spacing)],
            alignment: .leading,
            spacing: spacing
        ) {
            content
        }
    }
}

#Preview {
    ProfileView()
}
