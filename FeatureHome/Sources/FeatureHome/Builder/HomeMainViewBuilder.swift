//
//  File.swift
//  FeatureHome
//
//  Created by YD on 6/22/25.
//

import UIKit
import FeatureHomeInterface
import FeatureProductDetailInterface
import CydDomain

public final class HomeMainViewBuilder: HomeMainViewBuildable {
    private let fetchUseCase: FetchProductListUseCase
    private let detailBuilder: ProductDetailViewBuildable
    
    public init(fetchUseCase: FetchProductListUseCase, detailBuilder: ProductDetailViewBuildable) {
        self.fetchUseCase = fetchUseCase
        self.detailBuilder = detailBuilder
    }
    
    public func build() -> UIViewController {
        let viewModel = HomeMainViewModel(fetchUseCase: fetchUseCase)
        let viewController = HomeMainViewController(viewModel: viewModel, detailBuilder: detailBuilder)
        return viewController
    }
}
