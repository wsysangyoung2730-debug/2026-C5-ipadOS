import SwiftUI

struct ScenarioPanel: View {
    let scenario: Scenario

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("상황 카드")
                .font(.title2.bold())

            VStack(alignment: .leading, spacing: 12) {
                Text(scenario.title)
                    .font(.headline)

                Text(scenario.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))

            Text("등장인물")
                .font(.headline)

            ForEach(scenario.characters) { character in
                CharacterCard(character: character)
            }

            Spacer()
        }
        .padding()
    }
}

