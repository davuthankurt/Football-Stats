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
        view.backgroundColor = .white
        let tableView = UITableView()
        tableView.register(StandingsCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.tableView = tableView
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        viewModel?.loadStandings()
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
        guard let table = leagueTable?.standings.first else { return 0 }
        return table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? StandingsCell else { return UITableViewCell() }
        guard let table = leagueTable?.standings.first else { return cell }
        let team = table[indexPath.row]
        
        cell.rank.text = "\(team.rank)."
        cell.team.text = team.team.name
//        cell.form.text = team.form
        cell.goalsDiff.text = "\(team.goalsDiff)"
        cell.points.text = "\(team.points)"
//        cell.records.text = "\(team.records.win)"
    
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = StandingsCell()
        headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
        headerView.backgroundColor = .green

        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension StandingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        TODO
    }
}
