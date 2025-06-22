//
//  File.swift
//  FeatureProductDetail
//
//  Created by YD on 6/22/25.
//

import UIKit
import FeatureProductDetailInterface

public final class ProductDetailViewBuilder: ProductDetailViewBuildable {
    public init() {}
    
    public func build(linkUrl: String) -> UIViewController {
        let viewModel = ProductDetailViewModel(linkUrl: linkUrl)
        let viewController = ProductDetailViewController(viewModel: viewModel)
        return viewController
    }
}
