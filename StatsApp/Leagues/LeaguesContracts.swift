//
//  LeaguesContracts.swift
//  FootballApp
//
//  Created by Davuthan Kurt on 13.09.2024.
//

import Foundation


protocol LeaguesViewModelProtocol {
    var delegate: LeaguesViewModelDelegate? { get set }
    func load()
    func selectLeague(at index: Int)
}

enum LeaguesViewModelOutput {
    case updateTitle(String)
    case showLeagues([LeaguePresentation])
}

enum LeaguesViewRoute{
    case standings(StandingsViewModelProtocol)
}

protocol LeaguesViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: LeaguesViewModelOutput)
    func navigate(to route: LeaguesViewRoute)
}
