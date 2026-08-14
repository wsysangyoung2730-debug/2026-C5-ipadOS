import SwiftUI

struct ChallengeView: View {
    private let scenario = Scenario.sample

    var body: some View {
        HStack(spacing: 0) {
            ScenarioPanel(scenario: scenario)
                .frame(minWidth: 280, idealWidth: 340)

            Divider()

            ConversationBoard()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            Divider()

            ScorePanel()
                .frame(minWidth: 260, idealWidth: 320)
        }
        .navigationTitle("Challenge Mode")
    }
}

#Preview {
    ChallengeView()
}

