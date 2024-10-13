//
//  ClubsContracts.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 11.10.2024.
//

import Foundation

protocol ClubsViewModelProtocol {
    var delegate: ClubsViewModelDelegate? { get set }
    func selectPlayer(at index: Int)
    func loadClub()
}

enum ClubsViewModelOutput {
    case updateTitle(String)
    case showClubPage(ClubPresentation)
}

protocol ClubsViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: ClubsViewModelOutput)
}
