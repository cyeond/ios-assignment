//
//  File.swift
//  FeatureHome
//
//  Created by YD on 6/22/25.
//

import UIKit
import SnapKit
import Kingfisher
import CydDesignSystem

/**
 상품 리스트 UICollectionView를 그리기 위한 Cell
 
 - 구성 요소
    - 썸네일 이미지
    - 상품 이름
    - 가격 및 할인 정보
    - 별점 및 리뷰 개수
 */
final class ProductListItemCell: UICollectionViewCell {
    static let reuseIdentifier = "ProductListItemCell"
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = CydColor.Common.textPrimary
        label.lineBreakMode = .byCharWrapping
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private let priceView = ProductListItemPriceView()
    private let ratingLabel = ProductListItemRatingLabel()
    private var ratingLabelHeightConstraint: Constraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.backgroundColor = .clear
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceView)
        contentView.addSubview(ratingLabel)
        
        productImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(productImageView.snp.width)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        
        priceView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }
        
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(priceView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
            ratingLabelHeightConstraint = $0.height.equalTo(16).constraint
        }
    }
    
    func configure(with item: ProductListItem) {
        let url = URL(string: item.imageUrl)
        
        titleLabel.text = item.name
        productImageView.kf.setImage(with: url)
        priceView.configure(with: item)
        configureRatingLabel(rating: item.rating, reviewCount: item.reviewCount)
    }
    
    /// 리뷰 개수가 0보다 큰 상품에 대해서만 ratingLabel을 표시
    private func configureRatingLabel(rating: Double, reviewCount: Int) {
        ratingLabel.configure(rating: rating, reviewCount: reviewCount)
        
        if reviewCount > 0 {
            ratingLabel.isHidden = false
            ratingLabelHeightConstraint?.update(offset: 16)
        } else {
            ratingLabel.isHidden = true
            ratingLabelHeightConstraint?.update(offset: 0)
        }
    }
}
