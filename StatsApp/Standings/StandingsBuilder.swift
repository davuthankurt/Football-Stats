//
//  StandingsBuilder.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 27.09.2024.
//

import UIKit

final class StandingsBuilder {

    static func make() -> StandingsViewController {

        let viewController = StandingsViewController()
        viewController.viewModel = LeagueViewModel(service: app.service)
        return viewController
    }
}
