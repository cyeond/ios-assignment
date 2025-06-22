// The Swift Programming Language
// https://docs.swift.org/swift-book

public struct Product: Equatable {
    public let id: String
    public let name: String
    public let brand: String
    public let price: Int
    public let discountPrice: Int
    public let discountRate: Int
    public let imageUrl: String
    public let linkUrl: String
    public let tags: [String]
    public let benefits: [String]
    public let rating: Double
    public let reviewCount: Int

    public init(
        id: String,
        name: String,
        brand: String,
        price: Int,
        discountPrice: Int,
        discountRate: Int,
        imageUrl: String,
        linkUrl: String,
        tags: [String],
        benefits: [String],
        rating: Double,
        reviewCount: Int
    ) {
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.discountPrice = discountPrice
        self.discountRate = discountRate
        self.imageUrl = imageUrl
        self.linkUrl = linkUrl
        self.tags = tags
        self.benefits = benefits
        self.rating = rating
        self.reviewCount = reviewCount
    }
}
