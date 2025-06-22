//
//  File 2.swift
//  FeatureHome
//
//  Created by YD on 6/22/25.
//

import Foundation
import CydDomain

/**
 Domain 레이어의 Product Entity를 이용하여 상품 리스트를 그리기 위한 모델
 
 - price 숫자 표시를 3자리 단위로 나눠 표시하는 등의 리팩토링 가능
 */
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
