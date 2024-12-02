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
    var leagueCell = [LeaguePresentation]()
    var leagueResults: [Int: LeagueResponse] = [:]
    
    init(service: AppService) {
        self.service = service
    }
}

extension LeagueViewModel {
    
    func load() {
        notify(.updateTitle("DAKY Stats"))
//        39 pl, 203 superlig, 135 serie a, 61 ligue 1, 78 bundesliga, 140 la liga, 2 cl
//        ,140,135,78,61,203
        let leagueIds = [39]
        
        for league in leagueIds {
            service.fetchData(from: .standings(league: league), responseType: LeagueResponse.self) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(let standingsResponse):
                    leagueResults[league] = standingsResponse
                    
                    if leagueResults.keys.count == 1 {
                        let sortedLeagues = leagueIds.compactMap { self.leagueResults[$0] }
                        leagues = sortedLeagues
                        
                        let presentations = leagues.flatMap { $0.results.map { LeaguePresentation(league: $0) } }
                        leagueCell = presentations
                        notify(.showLeagues)
                    }
                    
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
    func reorderArray(array: [Int], order: [Int]) -> [Int] {
        return array.sorted { first, second in
            guard let firstIndex = order.firstIndex(of: first),
                  let secondIndex = order.firstIndex(of: second) else {
                return false
            }
            return firstIndex < secondIndex
        }
    }
    
    func didSelectRowAt(index: IndexPath) {
        if let selectedLeague = leagues[index.item].results.first {
            let viewModel = StandingsViewModel(league: selectedLeague, leagueName: selectedLeague.name)
//            dump(viewModel.standings)
            delegate?.navigate(to: .standings(viewModel))
        } else {
            print("no league available")
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return leagues.count
    }
    
    func cellForItemAt(index: IndexPath) -> LeaguePresentation {
        return leagueCell[index.item]
    }
    
    private func notify(_ output: LeaguesViewModelOutput){
        delegate?.handleViewModelOutput(output)
    }
}
