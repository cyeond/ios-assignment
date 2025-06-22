//
//  File.swift
//  FeatureHome
//
//  Created by YD on 6/22/25.
//

import UIKit
import FeatureHomeInterface

public final class HomeMainViewBuilder: HomeMainViewBuildable {
    public init() {}

    public func build() -> UIViewController {
        let viewModel = HomeMainViewModel()
        let viewController = HomeMainViewController(viewModel: viewModel)
        return viewController
    }
}
