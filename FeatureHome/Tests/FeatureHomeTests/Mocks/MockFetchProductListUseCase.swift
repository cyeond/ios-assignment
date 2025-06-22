//
//  File.swift
//  FeatureHome
//
//  Created by YD on 6/22/25.
//

import CydDomain

final class MockFetchProductListUseCase: FetchProductListUseCase {
    enum ResultType {
        case success([Product])
        case failure(Error)
    }

    var result: ResultType

    init(result: ResultType) {
        self.result = result
    }

    func execute() async throws -> [Product] {
        switch result {
        case .success(let products):
            return products
        case .failure(let error):
            throw error
        }
    }
}
