//
//  File.swift
//  FeatureProductDetail
//
//  Created by YD on 6/22/25.
//

import UIKit
import CydDomain
import FeatureProductDetailInterface

public final class ProductDetailViewBuilder: ProductDetailViewBuildable {
    public init() {}
    
    public func build(product: Product) -> UIViewController {
        let viewModel = ProductDetailViewModel(product: product)
        let viewController = ProductDetailViewController(viewModel: viewModel)
        return viewController
    }
}
