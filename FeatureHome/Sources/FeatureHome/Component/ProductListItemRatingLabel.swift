//
//  File.swift
//  FeatureHome
//
//  Created by YD on 6/22/25.
//

import UIKit
import CydCore
import CydDesignSystem

 
/// ProductListItemCell에서 별점 및 리뷰 영역을 담당하는 View
final class ProductListItemRatingLabel: UILabel {
    func configure(rating: Double, reviewCount: Int) {
        let fullFormat = Strings.Home.ratingReviewCountFormat
        let ratingFormat = Strings.Home.ratingFormat
        let reviewCountFormat = Strings.Home.reviewCountFormat
        
        let text = String(format: fullFormat, rating, reviewCount)
        let attributed = NSMutableAttributedString(string: text)
        
        let ratingText = String(format: ratingFormat, rating)
        if let ratingRange = text.range(of: ratingText) {
            let nsRange = NSRange(ratingRange, in: text)
            attributed.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: nsRange)
            attributed.addAttribute(.foregroundColor, value: CydColor.Common.accentGray, range: nsRange)
        }
        
        let reviewText = String(format: reviewCountFormat, reviewCount)
        if let reviewRange = text.range(of: reviewText) {
            let nsRange = NSRange(reviewRange, in: text)
            attributed.addAttribute(.font, value: UIFont.systemFont(ofSize: 11), range: nsRange)
            attributed.addAttribute(.foregroundColor, value: CydColor.Common.textSecondary, range: nsRange)
        }
        
        self.attributedText = attributed
    }
}
