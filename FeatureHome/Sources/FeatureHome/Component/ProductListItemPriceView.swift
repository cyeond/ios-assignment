//
//  File.swift
//  FeatureHome
//
//  Created by YD on 6/22/25.
//

import UIKit
import CydCore
import CydDesignSystem

final class ProductListItemPriceView: UIStackView {
    private let originalPriceLabel = UILabel()
    private let discountPriceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = UIColor.clear
        axis = .vertical
        spacing = 0
        
        originalPriceLabel.numberOfLines = 1
        discountPriceLabel.numberOfLines = 1
        
        addArrangedSubview(originalPriceLabel)
        addArrangedSubview(discountPriceLabel)
    }
    
    func configure(with item: ProductListItem) {
        let currencyUnit = Strings.Home.currencyWon
        let smallFont = UIFont.systemFont(ofSize: 12)
        let normalFont = UIFont.systemFont(ofSize: 13)
        let accentFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        if item.discountRate > 0 {
            let originalPriceText = "\(item.price)\(currencyUnit)"
            let attributeString = NSMutableAttributedString(string: originalPriceText)
            attributeString.addAttribute(.strikethroughStyle,
                                         value: NSUnderlineStyle.single.rawValue,
                                         range: NSRange(location: 0, length: attributeString.length))
            attributeString.addAttribute(.font,
                                         value: smallFont,
                                         range: NSRange(location: 0, length: attributeString.length))
            attributeString.addAttribute(.foregroundColor,
                                         value: CydColor.Common.textSecondary,
                                         range: NSRange(location: 0, length: attributeString.length))
            
            if let wonRange = originalPriceText.range(of: currencyUnit) {
                let nsRange = NSRange(wonRange, in: originalPriceText)
                attributeString.addAttribute(.font, value: smallFont, range: nsRange)
            }
            
            originalPriceLabel.attributedText = attributeString
            originalPriceLabel.isHidden = false
            
            let discountPriceText = String(format: Strings.Home.discountPriceFormat, item.discountRate, item.discountPrice)
            let attributedDiscount = NSMutableAttributedString(string: discountPriceText)
            
            if let rateRange = discountPriceText.range(of: "\(item.discountRate)%") {
                let nsRange = NSRange(rateRange, in: discountPriceText)
                attributedDiscount.addAttribute(.foregroundColor, value: CydColor.Common.accentRed, range: nsRange)
                attributedDiscount.addAttribute(.font, value: accentFont, range: nsRange)
            }
            
            if let priceRange = discountPriceText.range(of: "\(item.discountPrice)") {
                let nsRange = NSRange(priceRange, in: discountPriceText)
                attributedDiscount.addAttribute(.foregroundColor, value: CydColor.Common.textPrimary, range: nsRange)
                attributedDiscount.addAttribute(.font, value: accentFont, range: nsRange)
            }
            
            if let wonRange = discountPriceText.range(of: currencyUnit) {
                let nsRange = NSRange(wonRange, in: discountPriceText)
                attributedDiscount.addAttribute(.foregroundColor, value: CydColor.Common.textPrimary, range: nsRange)
                attributedDiscount.addAttribute(.font, value: normalFont, range: nsRange)
            }
            
            discountPriceLabel.attributedText = attributedDiscount
            discountPriceLabel.isHidden = false
            
        } else {
            let originalPriceText = "\(item.price)\(currencyUnit)"
            let attributedPrice = NSMutableAttributedString(string: originalPriceText)
            
            if let priceRange = originalPriceText.range(of: "\(item.price)") {
                let nsRange = NSRange(priceRange, in: originalPriceText)
                attributedPrice.addAttribute(.foregroundColor, value: CydColor.Common.textPrimary, range: nsRange)
                attributedPrice.addAttribute(.font, value: accentFont, range: nsRange)
            }
            
            if let wonRange = originalPriceText.range(of: currencyUnit) {
                let nsRange = NSRange(wonRange, in: originalPriceText)
                attributedPrice.addAttribute(.foregroundColor, value: CydColor.Common.textPrimary, range: nsRange)
                attributedPrice.addAttribute(.font, value: normalFont, range: nsRange)
            }
            
            originalPriceLabel.attributedText = attributedPrice
            originalPriceLabel.isHidden = false
            discountPriceLabel.isHidden = true
        }
    }
}
