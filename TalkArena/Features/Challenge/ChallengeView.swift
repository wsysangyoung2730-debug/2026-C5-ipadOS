import SwiftUI

struct ChallengeView: View {
    @State private var phase: ChallengePhase = .lobby
    @State private var selectedScenario: Scenario = .sample
    @State private var selectedChoice: DialogChoice?
    @State private var currentTurn = 1

    var body: some View {
        ZStack {
            switch phase {
            case .lobby:
                ChallengeLobbyView(
                    scenarios: Scenario.challengeDeck,
                    selectedScenario: selectedScenario,
                    selectAction: { scenario in
                        selectedScenario = scenario
                    },
                    startAction: {
                        currentTurn = 1
                        selectedChoice = nil
                        move(to: .intro)
                    }
                )
            case .intro:
                ChallengeIntroView(
                    scenario: selectedScenario,
                    backAction: { move(to: .lobby) },
                    startAction: { move(to: .dialogue) }
                )
            case .dialogue:
                DialogueSceneView(
                    scenario: selectedScenario,
                    turn: currentTurn
                ) { choice in
                    selectedChoice = choice
                    move(to: .feedback)
                }
            case .feedback:
                TurnFeedbackView(
                    selectedChoice: selectedChoice,
                    retryAction: { move(to: .dialogue) },
                    nextAction: {
                        if currentTurn >= 3 {
                            move(to: .result)
                        } else {
                            currentTurn += 1
                            selectedChoice = nil
                            move(to: .dialogue)
                        }
                    }
                )
            case .result:
                ChallengeResultView(
                    scenario: selectedScenario,
                    restartAction: {
                        currentTurn = 1
                        selectedChoice = nil
                        move(to: .intro)
                    },
                    lobbyAction: { move(to: .lobby) }
                )
            }
        }
        .animation(.easeInOut(duration: 0.24), value: phase)
    }

    private func move(to nextPhase: ChallengePhase) {
        withAnimation(.spring(response: 0.55, dampingFraction: 0.86)) {
            phase = nextPhase
        }
    }
}

private enum ChallengePhase {
    case lobby
    case intro
    case dialogue
    case feedback
    case result
}

private struct ChallengeLobbyView: View {
    let scenarios: [Scenario]
    let selectedScenario: Scenario
    let selectAction: (Scenario) -> Void
    let startAction: () -> Void

    var body: some View {
        ZStack {
            IllustratedStageView(characterMood: .relieved)

            HStack(spacing: 26) {
                VStack(alignment: .leading, spacing: 24) {
                    Label("Challenge Mode", systemImage: "gamecontroller.fill")
                        .font(.headline)
                        .foregroundStyle(TalkArenaColor.arenaPurple)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("오늘의 대화 미션을 고르자")
                            .font(.system(size: 44, weight: .heavy, design: .rounded))
                            .foregroundStyle(TalkArenaColor.ink)

                        Text("상황 카드를 선택하고, 대화 선택지를 고르며 점수와 피드백을 받아보세요.")
                            .font(.title3)
                            .foregroundStyle(TalkArenaColor.mutedInk)
                            .lineSpacing(6)
                    }

                    VStack(spacing: 14) {
                        ForEach(scenarios) { scenario in
                            ScenarioSelectionCard(
                                scenario: scenario,
                                isSelected: scenario.id == selectedScenario.id
                            ) {
                                selectAction(scenario)
                            }
                        }
                    }
                }
                .padding(32)
                .frame(maxWidth: 560, maxHeight: .infinity, alignment: .topLeading)
                .background(.white.opacity(0.90))
                .clipShape(RoundedRectangle(cornerRadius: 34))
                .shadow(color: .black.opacity(0.12), radius: 24, x: 0, y: 14)

                VStack(alignment: .leading, spacing: 24) {
                    Text("선택한 미션")
                        .font(.headline)
                        .foregroundStyle(TalkArenaColor.arenaPurple)

                    Text(selectedScenario.missionTitle)
                        .font(.system(size: 52, weight: .heavy, design: .rounded))
                        .foregroundStyle(TalkArenaColor.ink)

                    Text(selectedScenario.description)
                        .font(.title3)
                        .foregroundStyle(TalkArenaColor.mutedInk)
                        .lineSpacing(8)

                    HStack(spacing: 10) {
                        infoChip(selectedScenario.difficulty, systemImage: "speedometer")
                        infoChip("\(selectedScenario.estimatedMinutes)분", systemImage: "clock")
                    }

                    FlowPreview()

                    Spacer()

                    ArenaButton("미션 브리핑으로", systemImage: "arrow.right", action: startAction)
                }
                .padding(34)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 34))
            }
            .padding(34)
        }
    }

    private func infoChip(_ title: String, systemImage: String) -> some View {
        Label(title, systemImage: systemImage)
            .font(.headline)
            .foregroundStyle(TalkArenaColor.arenaPurple)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(.white.opacity(0.82))
            .clipShape(Capsule())
    }
}

private struct ScenarioSelectionCard: View {
    let scenario: Scenario
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(scenario.title)
                        .font(.headline)
                        .foregroundStyle(TalkArenaColor.ink)

                    Spacer()

                    Text(scenario.difficulty)
                        .font(.caption.bold())
                        .foregroundStyle(isSelected ? .white : TalkArenaColor.arenaPurple)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(isSelected ? TalkArenaColor.arenaPurple : TalkArenaColor.arenaPurple.opacity(0.10))
                        .clipShape(Capsule())
                }

                Text(scenario.missionTitle)
                    .font(.title3.bold())
                    .foregroundStyle(isSelected ? TalkArenaColor.arenaPurple : TalkArenaColor.mutedInk)

                HStack(spacing: 8) {
                    ForEach(scenario.tags.prefix(3), id: \.self) { tag in
                        Text(tag)
                            .font(.caption.bold())
                            .foregroundStyle(TalkArenaColor.mutedInk)
                            .padding(.horizontal, 9)
                            .padding(.vertical, 5)
                            .background(TalkArenaColor.creamSurface)
                            .clipShape(Capsule())
                    }
                }
            }
            .padding(18)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(isSelected ? TalkArenaColor.neonMint.opacity(0.18) : .white)
            .overlay {
                RoundedRectangle(cornerRadius: 22)
                    .stroke(isSelected ? TalkArenaColor.arenaPurple : .clear, lineWidth: 2)
            }
            .clipShape(RoundedRectangle(cornerRadius: 22))
            .shadow(color: .black.opacity(0.07), radius: 12, x: 0, y: 7)
        }
        .buttonStyle(.plain)
    }
}

private struct FlowPreview: View {
    private let steps = ["카드 선택", "브리핑", "대화", "피드백", "결과"]

    var body: some View {
        HStack(spacing: 8) {
            ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                Text(step)
                    .font(.caption.bold())
                    .foregroundStyle(index == 0 ? .white : TalkArenaColor.mutedInk)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(index == 0 ? TalkArenaColor.arenaPurple : .white.opacity(0.82))
                    .clipShape(Capsule())

                if index < steps.count - 1 {
                    Image(systemName: "chevron.right")
                        .font(.caption.bold())
                        .foregroundStyle(TalkArenaColor.mutedInk.opacity(0.6))
                }
            }
        }
        .padding(16)
        .background(.black.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ChallengeView()
}
