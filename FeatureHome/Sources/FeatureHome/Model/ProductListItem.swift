//
//  File 2.swift
//  FeatureHome
//
//  Created by YD on 6/22/25.
//

import Foundation
import CydDomain

struct ProductListItem: Hashable {
    let uuid = UUID()
    let id: String
    let name: String
    let imageUrl: String
    let linkUrl: String
    let price: Int
    let discountPrice: Int
    let discountRate: Int
    let rating: Double
    let reviewCount: Int
    
    init(product: Product) {
        self.id = product.id
        self.name = product.name
        self.imageUrl = product.imageUrl
        self.linkUrl = product.linkUrl
        self.price = product.price
        self.discountPrice = product.discountPrice
        self.discountRate = product.discountRate
        self.rating = product.rating
        self.reviewCount = product.reviewCount
    }
}
