//
//  StatsTrackerCellModel.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 13.11.2024.
//

import Foundation

protocol STCellViewModelProtocol {
    var delegate: STCellViewModelDelegate? { get set }
    var numberOfRowsInSection: Int { get set }
    func getPlayers()
    func cellForRowAt(index: IndexPath) -> PlayerPresentation
    func didSelectItemAt()
}

enum STCellViewModelOutput{
    case showPlayers
}

protocol STCellViewModelDelegate {
    func handleViewModelOutput(_ output: STCellViewModelOutput)
}
