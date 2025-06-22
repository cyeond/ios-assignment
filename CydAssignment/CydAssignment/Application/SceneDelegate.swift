//
//  SceneDelegate.swift
//  CydAssignment
//
//  Created by YD on 6/22/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let homeBuilder = AppDIContainer.createHomeBuilder()
        window.rootViewController = MainTabBarController(homeBuilder: homeBuilder)
        self.window = window
        window.makeKeyAndVisible()
    }
}
