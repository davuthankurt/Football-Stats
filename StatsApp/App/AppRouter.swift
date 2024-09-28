//
//  AppRouter.swift
//  FootballApp
//
//  Created by Davuthan Kurt on 13.09.2024.
//

import UIKit

final class AppRouter {
    func start(window: UIWindow){
        let viewController = LeaguesBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

