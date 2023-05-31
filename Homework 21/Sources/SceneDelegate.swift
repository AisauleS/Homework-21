//
//  SceneDelegate.swift
//  Homework 21
//
//  Created by Aisaule Sibatova on 17.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Assembler MVC module of Cards
        window = UIWindow(windowScene: windowScene)
        let controller = CardsController(cardFetcher: LocalCardFetcher())
        let navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
