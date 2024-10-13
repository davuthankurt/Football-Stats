//
//  ClubBuilder.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 11.10.2024.
//

import Foundation

final class ClubBuilder {
    
    static func make(with viewModel: ClubsViewModelProtocol) -> ClubsViewController {
        let viewController = ClubsViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
