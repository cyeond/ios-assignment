## 개요

CJ ENM 과제 제출을 위한 Repository입니다.

앱의 전반적인 지원 범위(Target Version, Orientation, Localizable, Light/Dark Theme)는 CJ온스타일 앱을 참고하여 설정하였습니다.

프로젝트 타이틀인 CydAssignment는 본 지원자의 이름을 기반으로 설정하였고, 과제 소요 시간은 약 7시간입니다.


---

## 미리보기


https://github.com/user-attachments/assets/87d6c76e-2482-4234-aacf-cd0a697f68ae



---

## 사용 기술

| 영역 | 기술 |
|------|------|
| Language | Swift |
| UI Framework | UIKit |
| Architecture | MVVM + Clean Architecture |
| Reactive | RxSwift |
| UI Layout | SnapKit |
| Modularization | Swift Package Manager (SPM) |

---

## 프로젝트 구조

```text
CydAssignment(Main App)
├── MainTabBarController   // 진입점
├── Resources              // LaunchScreen, info 등

+ Modules(SPM 패키지)
│
├── CydCore                // 공통 확장 기능, String 리소스 등
├── CydDesignSystem        // 색상, 이미지 리소스 등의 디자인 시스템
├── CydDomain              // Entity, Repository 인터페이스, UseCase
├── CydData                // DTO, Repository 구현부
├── FeatureHome            // 홈 탭 메인 화면, 상품 리스트 표시
└── FeatureProductDetail   // 상품 상세 페이지(WebView)
```

---

## 실행 방법

1. 이 저장소를 클론합니다.
2. Xcode에서 `CydAssignment.xcworkspace` 열기  
3. 실행 (`⌘R`)  
> 실제 기기에서 실행하는 경우 CydAssignment Target Setting -> General -> Signing 설정이 필요합니다.

---

##  테스트

- 모듈별로 간단한 유닛 테스트가 구성되어 있습니다.
    - `FeatureHomeTests` : ViewModel 테스트
    - `FeatureProductDetailTests` : ViewModel 테스트
    - `CydDataTests` : Repository 테스트

---

## 라이브러리 및 라이센스

이 프로젝트는 다음 오픈소스 라이브러리를 사용합니다.

- RxSwift: https://github.com/ReactiveX/RxSwift (MIT)
- SnapKit: https://github.com/SnapKit/SnapKit (MIT) 
- Kingfisher: https://github.com/onevcat/Kingfisher (MIT)


