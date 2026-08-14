import Foundation

extension Scenario {
    static let sample = Scenario(
        title: "회의 갈등 정리하기",
        description: "당신은 5인 규모 스타트업의 대리입니다. 회의에서 팀원 한 명이 계속 본인의 업무 지연을 외부 탓으로 돌리고 있고, 대표는 당신이 상황을 정리해주길 기대하고 있습니다.",
        characters: [
            CharacterProfile(
                name: "팀원 A",
                role: "개발 담당",
                personality: "방어적이고 예민함",
                currentEmotion: "억울함"
            ),
            CharacterProfile(
                name: "대표",
                role: "의사결정자",
                personality: "빠른 해결을 원함",
                currentEmotion: "조급함"
            )
        ]
    )
}

extension DialogChoice {
    static let samples = [
        DialogChoice(
            text: "일단 A님의 상황을 먼저 들어보죠.",
            strategy: .empathy
        ),
        DialogChoice(
            text: "지금은 변명보다 해결책이 필요합니다.",
            strategy: .direct
        ),
        DialogChoice(
            text: "외부 요청이 바뀐 지점을 먼저 확인해도 될까요?",
            strategy: .question
        ),
        DialogChoice(
            text: "오늘은 일정 기준부터 다시 합의하고 넘어가면 좋겠습니다.",
            strategy: .solution
        )
    ]
}

