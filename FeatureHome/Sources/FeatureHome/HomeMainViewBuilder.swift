//
//  File.swift
//  FeatureHome
//
//  Created by YD on 6/22/25.
//

import UIKit
import FeatureHomeInterface
import CydDomain

public final class HomeMainViewBuilder: HomeMainViewBuildable {
    private let fetchUseCase: FetchProductListUseCase
    
    public init(fetchUseCase: FetchProductListUseCase) {
        self.fetchUseCase = fetchUseCase
    }
    
    public func build() -> UIViewController {
        let viewModel = HomeMainViewModel(fetchUseCase: fetchUseCase)
        let viewController = HomeMainViewController(viewModel: viewModel)
        return viewController
    }
}
