//
//  StatsTrackerCellViewModel.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 13.11.2024.
//

import Foundation


final class StatsTrackerCellViewModel: StatsTrackerCellViewModelProtocol {
    
    
    var numberOfRowsInSection: Int
    
    var goalScorers: [PlayerPresentation]
    var asistMakers: [PlayerPresentation]
    
    init(goalScorers: [PlayerPresentation], asistMakers: [PlayerPresentation]) {
        self.goalScorers = goalScorers
        self.asistMakers = asistMakers
    }
    
}

extension StatsTrackerCellViewModel {
    
    func cellForRowAt() {
        <#code#>
    }
    
    func didSelectItemAt() {
        <#code#>
    }
}
