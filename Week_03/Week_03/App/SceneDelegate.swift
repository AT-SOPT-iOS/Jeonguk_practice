//
//  SceneDelegate.swift
//  Week_03
//
//  Created by 정정욱 on 4/26/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let loginViewController = ProductViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController) // 네비게이션 컨트롤러 추가
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController // 네비게이션 컨트롤러를 루트뷰로 설정
        window.makeKeyAndVisible()
        self.window = window
    }
    
}

