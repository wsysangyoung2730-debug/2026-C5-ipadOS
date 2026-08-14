import SwiftUI

struct ChallengeView: View {
    private let scenario = Scenario.sample
    @State private var phase: ChallengePhase = .intro

    var body: some View {
        ZStack {
            switch phase {
            case .intro:
                ChallengeIntroView(scenario: scenario) {
                    withAnimation(.spring(response: 0.55, dampingFraction: 0.86)) {
                        phase = .dialogue
                    }
                }
            case .dialogue:
                DialogueSceneView {
                    withAnimation(.spring(response: 0.55, dampingFraction: 0.86)) {
                        phase = .feedback
                    }
                }
            case .feedback:
                TurnFeedbackView(
                    retryAction: {
                        withAnimation(.spring(response: 0.55, dampingFraction: 0.86)) {
                            phase = .dialogue
                        }
                    },
                    nextAction: {
                        withAnimation(.spring(response: 0.55, dampingFraction: 0.86)) {
                            phase = .result
                        }
                    }
                )
            case .result:
                ChallengeResultView {
                    withAnimation(.spring(response: 0.55, dampingFraction: 0.86)) {
                        phase = .intro
                    }
                }
            }
        }
        .animation(.easeInOut(duration: 0.24), value: phase)
    }
}

private enum ChallengePhase {
    case intro
    case dialogue
    case feedback
    case result
}

#Preview {
    ChallengeView()
}
