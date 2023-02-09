//
//  SceneDelegate.swift
//  yugioh-mvvm
//
//  Created by Christian Rezende on 25/01/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
 
        self.window?.rootViewController = UINavigationController(rootViewController: HomeViewController(viewModel: HomeViewModel()))
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }

}

