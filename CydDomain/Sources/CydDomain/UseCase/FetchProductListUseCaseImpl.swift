//
//  File.swift
//  CydDomain
//
//  Created by YD on 6/22/25.
//

public final class FetchProductListUseCaseImpl: FetchProductListUseCase {
    private let repository: ProductRepository
    
    public init(repository: ProductRepository) {
        self.repository = repository
    }
    
    public func execute() async throws -> [Product] {
        return try await repository.fetchProductList()
    }
}
