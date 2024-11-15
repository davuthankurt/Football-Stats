//
//  StatsTrackerCellModel.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 13.11.2024.
//

import Foundation

protocol StatsTrackerCellViewModelProtocol {
    
    var numberOfRowsInSection: Int { get set }
    func cellForRowAt()
    func didSelectItemAt()
}

enum statsTrackerViewModelOutput{
    case showPlayers
}

protocol StatsTrackerCellViewModelDelegate {
    func handleViewModelOutput(_ output: statsTrackerViewModelOutput)
}
