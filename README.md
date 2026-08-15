# Talk Arena (가제)

AI 기반 대화 갈등 시뮬레이터 iPadOS 앱입니다.

사용자는 갈등·설득·협업 상황을 게임처럼 시뮬레이션하며, 선택지 기반 Challenge Mode와 음성 기반 Practice Mode를 통해 부담 없이 대화 대응력을 연습합니다.

## 프로젝트 목표

- 어려운 대화 상황을 안전하게 반복 연습할 수 있는 환경을 만든다.
- 게임처럼 가볍게 접근할 수 있는 대화 시뮬레이션 경험을 설계한다.
- iPadOS의 큰 화면을 활용해 상황 카드, 대화 로그, 선택지, 점수, 피드백 패널을 함께 보여준다.

## 실행 방법

Xcode에서 아래 프로젝트 파일을 열어 실행합니다.

```text
TalkArena.xcodeproj
```

권장 실행 환경:

- Xcode 26.5 이상
- iPadOS Simulator
- Scheme: `TalkArena`

## 핵심 모드

### Challenge Mode

선택지 기반 대화 게임 모드입니다.

- 앱이 상황 카드를 제시한다.
- 사용자는 매 턴 선택지 중 하나를 고른다.
- AI 상대가 반응하고, 턴별 평가와 점수가 제공된다.
- 최종 랭크와 리플레이 피드백을 확인한다.

### Practice Mode

음성 기반 현실 리허설 모드입니다.

- 사용자가 실제 상황과 상대 성향을 직접 설정한다.
- 음성으로 AI 상대와 대화한다.
- 대화 후 개선점, 대안 표현, 다음 질문을 피드백받는다.

## iPadOS 설계 방향

- iPad의 넓은 화면을 비주얼 노벨형 무대처럼 활용한다.
- 왼쪽에는 모드 전환 사이드바를 두고, 중앙에는 상황 일러스트·대사창·선택지를 크게 배치한다.
- Challenge Mode는 `인트로 → 대화 선택 → 턴 피드백 → 최종 결과` 흐름으로 구성한다.
- 카드, 선택지, 감정 게이지, 랭크, 리플레이 등 게임적인 UI 요소를 활용한다.
- Apple Pencil은 초기 핵심 기능이 아니라, 추후 대화 로그 주석이나 분기 맵 표시 기능으로 확장한다.

## 폴더 구조

```text
TalkArena/
├── App/
│   └── TalkArenaApp.swift
├── Core/
│   ├── Models/
│   └── Services/
├── Features/
│   ├── Challenge/
│   ├── Practice/
│   └── Home/
├── Shared/
│   ├── Components/
│   └── DesignSystem/
└── Resources/
    └── Assets.xcassets/
```

## 기술 스택

- Swift
- SwiftUI
- iPadOS
- AI 대화 시뮬레이션 API
- Speech Recognition 또는 음성 입력 기능은 추후 검토

## Git 전략

### 태그 컨벤션

태그는 반드시 소문자로 작성합니다.

| 태그 | 사용 기준 |
|---|---|
| `init` | 가장 처음 Initial Commit에 태그 붙이기 |
| `feat` | 새로운 기능 구현 시 사용 |
| `fix` | 버그나 오류 해결 시 사용 |
| `docs` | README, 템플릿 등 프로젝트 내 문서 수정 시 사용 |
| `setting` | 프로젝트 관련 설정 변경 시 사용 |
| `add` | 사진 등 에셋이나 라이브러리 추가 시 사용 |
| `refactor` | 기존 코드를 리팩토링하거나 수정할 시 사용 |
| `chore` | 별로 중요한 수정이 아닐 시 사용 |

### 커밋 컨벤션

```text
[태그] 작업 내용
```

- 태그는 반드시 소문자로 작성합니다.
- 내용은 한글로 작성합니다.
- 제목은 50자를 넘지 않도록 간단하게 명령조로 작성합니다.
- 설명이 필요한 경우 description에 작성합니다.

예시:

```text
[feat] 로그인 기능 구현
[docs] README 작성
[setting] 프로젝트 기본 설정 추가
```

### 브랜치 컨벤션

```text
태그/#이슈번호-작업하는파일
```

예시:

```text
feat/#1-loginUI
docs/#2-readme
setting/#3-projectStructure
```

### 브랜치 전략

#### main

출시(release)에 사용하는 브랜치입니다.

#### develop

개발된 기능들을 최종적으로 합쳐서 확인하는 브랜치입니다.

- 기본 개발 브랜치입니다.
- 개발을 마친 후에는 반드시 develop에 머지합니다.
- 개인 브랜치에서 작업을 마치면, 개인 브랜치에서 develop 브랜치를 머지한 후 develop에 Pull Request를 요청합니다.

#### feature

태그를 붙이는 모든 작업 브랜치를 의미합니다.

- 기능 개발, 버그 수정, 문서 수정, 설정 변경 등은 반드시 feature 브랜치에서 진행합니다.
- 작업 브랜치는 브랜치 컨벤션을 따릅니다.

## 초기 MVP 범위

1. Challenge Mode 기본 플로우
2. 상황 카드 목록
3. 선택지 기반 턴 진행
4. AI 상대 반응 표시
5. 턴별 점수와 피드백 표시
6. 최종 결과 화면

## 참고 문서

- [PRD 문서](./docs/PRD.md)
