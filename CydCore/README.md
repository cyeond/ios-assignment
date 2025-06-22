# CydCore
===============

## 개요
- 앱 및 각 모듈들에서 공통적으로 사용하는 확장 기능, String 리소스 등을 정의하는 모듈입니다.
- 공통적으로 사용할 라이브러리는 이 모듈에서 의존성으로 관리하며, 버전 관리를 위해 다른 모듈에서는 직접 추가하지 않도록 합니다.

## 구조
- Extensions
- StringFile

## Extensions
- UIKit, Foundation 등 주요 프레임워크의 기능 확장을 정의합니다.  

## StringFile
- 전역적으로 사용하는 문자열을 정의하며, 현지화는 해당 프로젝트에서 고려하지 않습니다.  
  - 구조 예시:
    - `Strings.Home.navigationTitle`
