//
//  File.swift
//  FeatureProductDetail
//
//  Created by YD on 6/22/25.
//

import UIKit
import CydDomain

public protocol ProductDetailViewBuildable {
    func build(product: Product) -> UIViewController
}
