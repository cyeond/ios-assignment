//
//  File.swift
//  FeatureProductDetail
//
//  Created by YD on 6/22/25.
//

import UIKit

public protocol ProductDetailViewBuildable {
    func build(linkUrl: String) -> UIViewController
}
