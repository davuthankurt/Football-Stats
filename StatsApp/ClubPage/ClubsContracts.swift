//
//  ClubsContracts.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 11.10.2024.
//

import Foundation
import StatsAPI

protocol ClubsViewModelProtocol {
    var delegate: ClubsViewModelDelegate? { get set }
    func didSelectRowAt(index: IndexPath)
    func cellForRowAt(index: IndexPath) -> ClubPlayerCellPresentation
    func numberOfRowsInSection(section: Int) -> Int
    func loadClub()
}

enum ClubsViewModelOutput {
    case updateTitle(String)
    case showClubPage(ClubPresentation)
}

protocol ClubsViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: ClubsViewModelOutput)
}
