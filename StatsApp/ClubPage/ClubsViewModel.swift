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
    let teamId = 21
    init(service: AppService) {
        self.service = service
    }
}

extension ClubsViewModel {

    func loadClub() {
        service.fetchData(from: .club(team: teamId), responseType: Clubs.self) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let clubResponse):
                print(clubResponse)
                print(clubResponse.team.name)
                print(clubResponse.players.first?.name)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectPlayer(at index: Int) {
        
    }
    
    private func notify(_ output: ClubsViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
