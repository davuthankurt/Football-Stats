//
//  StandingsContracts.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 27.09.2024.
//

import Foundation

protocol StandingsViewModelProtocol {
    var delegate: StandingsViewModelDelegate? { get set }
    func selectTeam(at index: Int)
    func loadStandings()
}

enum StandingsViewModelOutput {
    case updateTitle(String)
    case showTeams(StandingsPresentation)
}

enum StandingsViewRoute {
    case clubPage(ClubsViewModelProtocol)
}

protocol StandingsViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: StandingsViewModelOutput)
    func navigate(to route: StandingsViewRoute)
}
