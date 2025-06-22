//
//  File.swift
//  CydDomain
//
//  Created by YD on 6/22/25.
//

public protocol ProductRepository {
    func fetchProductList() async throws -> [Product]
}
