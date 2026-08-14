import SwiftUI

struct IllustratedStageView: View {
    let characterMood: CharacterMood

    var body: some View {
        ZStack(alignment: .bottom) {
            stageBackground

            HStack(alignment: .bottom, spacing: 28) {
                decorativePlant
                Spacer()
                character
                Spacer()
                decorativeWindow
            }
            .padding(.horizontal, 52)
            .padding(.bottom, 108)
        }
        .clipShape(RoundedRectangle(cornerRadius: 34))
    }

    private var stageBackground: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.99, green: 0.94, blue: 0.84),
                    Color(red: 0.88, green: 0.82, blue: 1.00),
                    Color(red: 0.77, green: 0.91, blue: 1.00)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Circle()
                .fill(.white.opacity(0.36))
                .frame(width: 360, height: 360)
                .offset(x: -260, y: -180)

            RoundedRectangle(cornerRadius: 28)
                .fill(.white.opacity(0.20))
                .frame(width: 280, height: 420)
                .rotationEffect(.degrees(-8))
                .offset(x: 280, y: -40)

            VStack(spacing: 18) {
                ForEach(0..<7, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.white.opacity(0.22))
                        .frame(height: 8)
                }
            }
            .padding(.horizontal, 60)
            .offset(y: -80)
        }
    }

    private var character: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .fill(TalkArenaColor.arenaPurple.opacity(0.20))
                    .frame(width: 170, height: 170)
                    .offset(y: 8)

                Circle()
                    .fill(Color(red: 0.99, green: 0.78, blue: 0.62))
                    .frame(width: 118, height: 118)
                    .overlay(alignment: .top) {
                        Capsule()
                            .fill(Color(red: 0.16, green: 0.13, blue: 0.23))
                            .frame(width: 126, height: 64)
                            .offset(y: -26)
                    }
                    .overlay {
                        face
                    }
            }

            RoundedRectangle(cornerRadius: 32)
                .fill(
                    LinearGradient(
                        colors: [TalkArenaColor.arenaPurple, Color(red: 0.16, green: 0.11, blue: 0.30)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 190, height: 190)
                .overlay(alignment: .top) {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(.white.opacity(0.16))
                        .frame(width: 92, height: 18)
                        .padding(.top, 26)
                }
                .shadow(color: TalkArenaColor.arenaPurple.opacity(0.35), radius: 24, x: 0, y: 18)
                .offset(y: -8)
        }
    }

    private var face: some View {
        VStack(spacing: 16) {
            HStack(spacing: 28) {
                Circle()
                    .fill(TalkArenaColor.ink)
                    .frame(width: 10, height: 10)
                Circle()
                    .fill(TalkArenaColor.ink)
                    .frame(width: 10, height: 10)
            }

            Capsule()
                .stroke(TalkArenaColor.ink, lineWidth: 3)
                .frame(width: characterMood == .confident ? 38 : 30, height: characterMood == .confident ? 16 : 10)
                .scaleEffect(y: characterMood == .tense ? -1 : 1)
        }
        .offset(y: 12)
    }

    private var decorativePlant: some View {
        VStack(spacing: -10) {
            Image(systemName: "leaf.fill")
                .font(.system(size: 82))
                .foregroundStyle(TalkArenaColor.trustGreen.opacity(0.78))
                .rotationEffect(.degrees(-18))
            RoundedRectangle(cornerRadius: 18)
                .fill(Color(red: 0.78, green: 0.53, blue: 0.34))
                .frame(width: 84, height: 86)
        }
        .opacity(0.86)
    }

    private var decorativeWindow: some View {
        RoundedRectangle(cornerRadius: 22)
            .fill(.white.opacity(0.30))
            .frame(width: 150, height: 210)
            .overlay {
                VStack {
                    Divider()
                    Spacer()
                    Divider()
                }
                .padding()

                HStack {
                    Divider()
                    Spacer()
                    Divider()
                }
                .padding()
            }
            .opacity(0.78)
    }
}

enum CharacterMood {
    case confident
    case tense
    case relieved
}

