//
//  PlayerViewModel.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 26.10.2024.
//

import Foundation
import StatsAPI

final class PlayerViewModel: PlayerViewModelProtocol {
    weak var delegete: PlayerViewModelDelegate?
    private let service: AppService
    let playerId: Int
    
    init(service: AppService, playerId: Int) {
        self.service = service
        self.playerId = playerId
    }
}

extension PlayerViewModel {
    
    func loadPlayer() {
        
        service.fetchData(from: .player(id: playerId), responseType: PlayerResponse.self) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                guard let footballer = response.response.first else { return }
                let presentation = PlayerPresentation(footballer: footballer)
                notify(.showPlayerPage)
                print(presentation.player.name)
                
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        
        }
    }
    
    func notify(_ output: PlayerViewModelOutput) {
        delegete?.handleViewModelOutput(output)
    }
}
