import SwiftUI

struct ArenaSidebar: View {
    @Binding var selectedMode: AppMode

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 10) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(TalkArenaColor.arenaPurple)
                        .frame(width: 34, height: 34)
                        .overlay {
                            Image(systemName: "bubble.left.and.text.bubble.right.fill")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.white)
                        }

                    Text("Talk Arena")
                        .font(.title3.bold())
                        .foregroundStyle(TalkArenaColor.ink)
                }

                Text("대화 전략 시뮬레이터")
                    .font(.caption)
                    .foregroundStyle(TalkArenaColor.mutedInk)
            }

            VStack(spacing: 12) {
                ForEach(AppMode.allCases) { mode in
                    sidebarButton(for: mode)
                }
            }

            Spacer()

            VStack(alignment: .leading, spacing: 14) {
                Label("설정", systemImage: "gearshape")
                Label("도움말", systemImage: "questionmark.circle")
            }
            .font(.callout.weight(.semibold))
            .foregroundStyle(TalkArenaColor.mutedInk)
        }
        .padding(24)
        .frame(width: 244, alignment: .leading)
        .background(.white.opacity(0.76))
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .shadow(color: .black.opacity(0.07), radius: 18, x: 0, y: 10)
    }

    private func sidebarButton(for mode: AppMode) -> some View {
        Button {
            selectedMode = mode
        } label: {
            HStack(spacing: 12) {
                Image(systemName: mode.systemImage)
                    .frame(width: 22)

                Text(mode.koreanTitle)
                    .font(.headline)
            }
            .foregroundStyle(selectedMode == mode ? .white : TalkArenaColor.mutedInk)
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(selectedMode == mode ? TalkArenaColor.arenaPurple : .clear)
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

