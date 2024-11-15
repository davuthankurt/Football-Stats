//
//  PlayerContracts.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 26.10.2024.
//

import Foundation

protocol PlayerViewModelProtocol {
    var delegete: PlayerViewModelDelegate? { get set }
    func loadPlayer()
}

enum PlayerViewModelOutput {
    case showPlayerPage
}

protocol PlayerViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: PlayerViewModelOutput)
}
