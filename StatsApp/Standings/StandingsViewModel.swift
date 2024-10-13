//
//  StandingsViewModel.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 27.09.2024.
//

import Foundation
import StatsAPI

final class StandingsViewModel: StandingsViewModelProtocol {

    weak var delegate: StandingsViewModelDelegate?
    public var standings: StandingsPresentation
    public var leagueName: String
    
    init(league: League, leagueName: String) {
        self.standings = StandingsPresentation(league: league)
        self.leagueName = leagueName
    }
}

extension StandingsViewModel {
    
    func loadStandings() {
        notify(.updateTitle(leagueName))
        notify(.showTeams(standings))
    }
    
    func selectTeam(at index: Int) {
        let viewModel = ClubsViewModel()
    }
    
    private func notify(_ output: StandingsViewModelOutput){
        delegate?.handleViewModelOutput(output)
    }
}


