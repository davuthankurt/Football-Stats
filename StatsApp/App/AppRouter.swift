//
//  AppRouter.swift
//  FootballApp
//
//  Created by Davuthan Kurt on 13.09.2024.
//

import UIKit

final class AppRouter {
    func start(window: UIWindow){
        
        let tabBarController = UITabBarController()
        
        let leagueViewController = LeaguesBuilder.make()
        let leagueNavigationController = UINavigationController(rootViewController: leagueViewController)
        leagueNavigationController.tabBarItem = UITabBarItem(title: "Leagues", image: UIImage(systemName: "list.dash"), tag: 0)
        
        let statsTrackerViewController = StatsTrackerBuilder.make()
        let statsTrackerNavigationController = UINavigationController(rootViewController: statsTrackerViewController)
        statsTrackerNavigationController.tabBarItem = UITabBarItem(title: "Stats Tracker", image: UIImage(systemName: "star"), tag: 1)
        
        tabBarController.viewControllers = [leagueNavigationController, statsTrackerNavigationController]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}

