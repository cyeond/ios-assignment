//
//  File.swift
//  CydData
//
//  Created by YD on 6/22/25.
//

import Foundation
import CydDomain

public final class ProductRepositoryImpl: ProductRepository {
    public init() {}

    public func fetchProductList() async throws -> [Product] {
        guard let url = Bundle.module.url(forResource: "products", withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }

        let data = try Data(contentsOf: url)
        let dtos = try JSONDecoder().decode([ProductDTO].self, from: data)
        return dtos.map { $0.toDomain() }
    }
}
