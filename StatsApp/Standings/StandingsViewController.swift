//
//  StandingsViewController.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 27.09.2024.
//

import UIKit

class StandingsViewController: UIViewController {
    
    private var tableView: UITableView?
    public var leagueTable: StandingsPresentation?
    
    var viewModel: StandingsViewModelProtocol? {
        didSet{
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView = tableView
        view.addSubview(tableView)
    }
}

extension StandingsViewController: StandingsViewModelDelegate {
    func handleViewModelOutput(_ output: StandingsViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .showTeams(let standingsTable):
            self.leagueTable = standingsTable
            tableView?.reloadData()
        }
    }
}

extension StandingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = leagueTable?.standings.first?.first?.team.name
        return cell
    }
}

extension StandingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        TODO
    }
}
