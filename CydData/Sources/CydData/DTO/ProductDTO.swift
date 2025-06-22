// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct ProductDTO: Decodable {
    public let id: String
    public let name: String
    public let brand: String
    public let price: Int
    public let discountPrice: Int
    public let discountRate: Int
    public let image: String
    public let link: String
    public let tags: [String]
    public let benefits: [String]
    public let rating: Double
    public let reviewCount: Int
}
