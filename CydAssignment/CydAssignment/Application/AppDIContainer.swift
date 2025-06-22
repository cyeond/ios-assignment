//
//  AppDIContainer.swift
//  CydAssignment
//
//  Created by YD on 6/22/25.
//

import CydData
import CydDomain
import FeatureHome
import FeatureHomeInterface
import FeatureProductDetail

struct AppDIContainer {
    static func createHomeBuilder() -> HomeMainViewBuildable {
        let productRepository = ProductRepositoryImpl()
        let fetchProductUseCase = FetchProductListUseCaseImpl(repository: productRepository)
        let productDetailBuilder = ProductDetailViewBuilder()
        return HomeMainViewBuilder(fetchUseCase: fetchProductUseCase, detailBuilder: productDetailBuilder)
    }
}
