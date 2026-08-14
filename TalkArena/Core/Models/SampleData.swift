import Foundation

extension Scenario {
    static let sample = Scenario(
        title: "회의 갈등 정리하기",
        missionTitle: "책임 떠넘기기",
        description: "당신은 5인 규모 스타트업의 대리입니다. 회의에서 팀원 한 명이 계속 본인의 업무 지연을 외부 탓으로 돌리고 있고, 대표는 당신이 상황을 정리해주길 기대하고 있습니다.",
        openingLine: "이게 전부 제 잘못은 아니잖아요. 외부 요청이 계속 바뀌었다고요.",
        difficulty: "보통",
        estimatedMinutes: 5,
        tags: ["감정 인정", "책임 조율", "긴장 높음"],
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

    static let challengeDeck: [Scenario] = [
        .sample,
        Scenario(
            title: "친구와 약속 다시 잡기",
            missionTitle: "계속 미뤄지는 약속",
            description: "친한 친구가 약속을 여러 번 미뤘습니다. 서운함을 말하고 싶지만 관계가 어색해지는 건 피하고 싶습니다.",
            openingLine: "미안해. 요즘 정신이 없어서 또 못 갈 것 같아.",
            difficulty: "쉬움",
            estimatedMinutes: 4,
            tags: ["서운함 표현", "관계 유지", "부드러운 요청"],
            characters: [
                CharacterProfile(
                    name: "친구",
                    role: "오래 알고 지낸 친구",
                    personality: "미안하다는 말은 잘하지만 행동 변화는 느림",
                    currentEmotion: "미안함"
                )
            ]
        ),
        Scenario(
            title: "팀원에게 피드백하기",
            missionTitle: "반복되는 마감 지연",
            description: "팀 프로젝트에서 한 팀원이 계속 마감을 늦추고 있습니다. 공격적으로 들리지 않게 피드백하면서 다음 행동을 합의해야 합니다.",
            openingLine: "이번에도 조금 늦을 것 같아요. 제가 맡은 부분이 생각보다 복잡해서요.",
            difficulty: "어려움",
            estimatedMinutes: 7,
            tags: ["피드백", "합의 만들기", "팀 분위기"],
            characters: [
                CharacterProfile(
                    name: "팀원 B",
                    role: "프로젝트 참여자",
                    personality: "압박을 받으면 방어적으로 반응함",
                    currentEmotion: "부담감"
                ),
                CharacterProfile(
                    name: "팀장",
                    role: "진행 책임자",
                    personality: "일정을 중요하게 봄",
                    currentEmotion: "초조함"
                )
            ]
        )
    ]
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
