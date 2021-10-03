//
//  SceneDelegate.swift
//  29thAssignment
//
//  Created by taehy.k on 2021/10/03.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let googleStoryboard = UIStoryboard(name: "GoogleStoryboard", bundle: nil)
        let googleSignInViewController = googleStoryboard.instantiateViewController(identifier: "GoogleSignInViewController") as? GoogleSignInViewController
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = googleSignInViewController
        window?.makeKeyAndVisible()
        
    }


}

