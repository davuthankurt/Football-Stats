//
//  PlayerViewController.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 26.10.2024.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var viewModel: PlayerViewModelProtocol? {
        didSet {
            viewModel?.delegete = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel?.loadPlayer()
    }
}

extension PlayerViewController: PlayerViewModelDelegate {
    func handleViewModelOutput(_ output: PlayerViewModelOutput) {
        
    }
}
