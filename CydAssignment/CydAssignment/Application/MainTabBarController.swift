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
        let homeBuilder: HomeMainViewBuildable = HomeMainViewBuilder()
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
