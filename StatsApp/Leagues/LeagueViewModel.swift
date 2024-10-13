//
//  LeagueViewModel.swift
//  FootballApp
//
//  Created by Davuthan Kurt on 14.09.2024.
//

import Foundation
import StatsAPI

final class LeagueViewModel: LeaguesViewModelProtocol {
    weak var delegate: LeaguesViewModelDelegate?
    private let service: AppService
    public var leagues = [LeagueResponse]()
    
    init(service: AppService) {
        self.service = service
    }
    
}

extension LeagueViewModel {
    
    func load() {
        notify(.updateTitle("Leagues"))
//        39 pl, 203 superlig, 135 serie a, 61 ligue 1, 78 bundesliga, 140 la liga
//        ,140,135,78,61,203
        let leagueIds = [39]
        
        for league in leagueIds {
            service.fetchData(from: .standings(league: league), responseType: LeagueResponse.self) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(let standingsResponse):
                    leagues.append(standingsResponse)
                    if leagues.count == 1 {
                        let presentations = leagues.flatMap { $0.results.map { LeaguePresentation(league: $0) } }
                        notify(.showLeagues(presentations))
                    }
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
    
    func selectLeague(at index: Int) {
        if let selectedLeague = leagues[index].results.first {
            
            let viewModel = StandingsViewModel(league: selectedLeague, leagueName: selectedLeague.name)
//            dump(viewModel.standings) 
            delegate?.navigate(to: .standings(viewModel))
        } else {
            print("no league available")
        }
    }
    
    private func notify(_ output: LeaguesViewModelOutput){
        delegate?.handleViewModelOutput(output)
    }
}
