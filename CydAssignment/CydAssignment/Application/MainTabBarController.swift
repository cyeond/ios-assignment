//
//  MainTabBarController.swift
//  CydAssignment
//
//  Created by YD on 6/22/25.
//

import UIKit
import CydCore
import CydDesignSystem
import FeatureHome
import FeatureHomeInterface

class MainTabBarController: UITabBarController {
    private let homeBuilder: HomeMainViewBuildable

    init(homeBuilder: HomeMainViewBuildable) {
        self.homeBuilder = homeBuilder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setViewControllers()
    }
    
    private func setupViews() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = CydColor.Common.background
        
        tabBar.isTranslucent = false
        tabBar.tintColor = CydColor.Brand.primary
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    private func setViewControllers() {
        let homeVC = homeBuilder.build()
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem(
            title: Strings.Main.homeTabTitle,
            image: CydImage.Icon.home,
            selectedImage: CydImage.Icon.homeSelected
        )
        
        self.setViewControllers([homeNav], animated: false)
    }
}
