# CydDomain
===============

## 개요
- 애플리케이션의 핵심 비즈니스 로직과 규칙을 정의하는 중앙 레이어입니다.

## 구조
- Model
- UseCase
- Repository

## Model
- 앱의 핵심 데이터를 표현하는 모델입니다.
- ex: Product

## UseCase
- 특정한 비즈니스 요구사항을 수행하는 유스케이스 계층입니다.
- ex: FetchProductListUseCase

## Repository
- 실제 구현체는 Data 계층에 위임하며, Domain 계층에서는 추상화된 프로토콜만 정의합니다.
- ex: ProductRepository
