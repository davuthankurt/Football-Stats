//
//  ClubsViewController.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 11.10.2024.
//

import UIKit

class ClubsViewController: UIViewController, ClubsViewModelDelegate {
    func handleViewModelOutput(_ output: ClubsViewModelOutput) {
        
    }
    
    
    var viewModel: ClubsViewModelProtocol? {
        didSet{
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
