//
//  ClubsViewModel.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 11.10.2024.
//

import Foundation
import StatsAPI

final class ClubsViewModel: ClubsViewModelProtocol {
    
    weak var delegate: ClubsViewModelDelegate?
    private let service: AppService
    var playerCell: [ClubPlayerCellPresentation] = []
    let teamId: Int
    init(service: AppService, teamId: Int) {
        self.service = service
        self.teamId = teamId
    }
}

extension ClubsViewModel {

    func loadClub() {
        service.fetchData(from: .club(team: teamId), responseType: ClubsResponse.self) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let clubResponse):
                
                guard let club = clubResponse.results.first else { return }
                let presentation = ClubPresentation(club: club)
                playerCell = presentation.players.map { ClubPlayerCellPresentation(cell: $0) }
                notify(.updateTitle(presentation.team.name))
                notify(.showClubPage(presentation))

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return playerCell.count
    }

    func cellForRowAt(index: IndexPath) -> ClubPlayerCellPresentation  {
        return playerCell[index.row]
    }
        
    func didSelectRowAt(index: IndexPath) {
        
    }
    
    private func notify(_ output: ClubsViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

