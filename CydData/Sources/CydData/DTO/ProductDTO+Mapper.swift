//
//  File.swift
//  CydData
//
//  Created by YD on 6/22/25.
//

import CydDomain

extension ProductDTO {
    func toDomain() -> Product {
        return Product(
            id: id,
            name: name,
            brand: brand,
            price: price,
            discountPrice: discountPrice,
            discountRate: discountRate,
            imageUrl: image,
            linkUrl: link,
            tags: tags,
            benefits: benefits,
            rating: rating,
            reviewCount: reviewCount
        )
    }
}
