//
//  ClubsViewController.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 11.10.2024.
//

import UIKit
import Kingfisher

class ClubsViewController: UIViewController {
    
    private var tableView: UITableView?
    let clubBox = UIView()
    
    var viewModel: ClubsViewModelProtocol? {
        didSet{
            viewModel?.delegate = self
        }
    }
    
    var club: ClubPresentation?
    
    var teamImage = UIImageView()
    var teamName = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.loadClub()
        configureContents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let gradient = CAGradientLayer()
        gradient.frame = clubBox.bounds
        gradient.colors = [
            UIColor(red: 36/255, green: 54/255, blue: 66/255, alpha: 1).cgColor,
            UIColor(red: 56/255, green: 116/255, blue: 120/255, alpha: 1).cgColor,
        ]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        clubBox.layer.insertSublayer(gradient, at: 0)
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = [
            UIColor(red: 98/255, green: 149/255, blue: 132/255, alpha: 1).cgColor,
            UIColor(red: 226/255, green: 241/255, blue: 231/255, alpha: 1).cgColor
            ]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")

    }
}

extension ClubsViewController {
    
    func configureContents(){
        configureView()
        
    }
    
    func configureView(){
        view.backgroundColor = .white
    }
    
    func configureTableView() {
        
        let tableView = UITableView()
        tableView.register(ClubPlayersCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0.0
        
        self.tableView = tableView
        view.addSubview(tableView)
        
        
        clubBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(clubBox)
        
        teamImage.translatesAutoresizingMaskIntoConstraints = false
        
        guard let selectedTeam = club?.team else { return }
        let url = URL(string: selectedTeam.logo)
        teamImage.kf.setImage(with: url)
        teamImage.contentMode = .scaleAspectFit
        clubBox.addSubview(teamImage)
        
        teamName.translatesAutoresizingMaskIntoConstraints = false
        teamName.font = .systemFont(ofSize: 24)
        teamName.textColor = UIColor(red: 36/255, green: 54/255, blue: 66/255, alpha: 1)
        teamName.text = selectedTeam.name
        clubBox.addSubview(teamName)
        
        NSLayoutConstraint.activate([
            clubBox.topAnchor.constraint(equalTo: navigationController!.navigationBar.bottomAnchor),
            clubBox.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            clubBox.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            clubBox.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            tableView.topAnchor.constraint(equalTo: clubBox.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            teamImage.centerYAnchor.constraint(equalTo: clubBox.centerYAnchor),
            teamImage.leadingAnchor.constraint(equalTo: clubBox.layoutMarginsGuide.leadingAnchor),
            teamImage.heightAnchor.constraint(equalTo: clubBox.heightAnchor, multiplier: 0.5),
            teamName.leadingAnchor.constraint(equalTo: teamImage.trailingAnchor, constant: 8),
            teamName.centerYAnchor.constraint(equalTo: teamImage.centerYAnchor),
        ])
    }
    
}

extension ClubsViewController: ClubsViewModelDelegate {
    func handleViewModelOutput(_ output: ClubsViewModelOutput) {
        switch output {
        case .showClubPage(let clubPresentation):
            self.club = clubPresentation
            configureTableView()
            tableView?.reloadData()
        case .updateTitle(let title):
            self.title = title
        }
    }
}

extension ClubsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ClubPlayersCell else { return UITableViewCell() }

        if let player = viewModel?.cellForRowAt(index: indexPath) {
            cell.configureCell(with: player)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ClubPlayersCell()
        headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.rowHeight)
        
        headerView.backgroundColor = UIColor(red: 36/255, green: 54/255, blue: 66/255, alpha: 1)
        headerView.position.textColor = UIColor(red: 226/255, green: 241/255, blue: 231/255, alpha: 1)
        headerView.age.textColor = UIColor(red: 226/255, green: 241/255, blue: 231/255, alpha: 1)
        headerView.name.textColor = UIColor(red: 226/255, green: 241/255, blue: 231/255, alpha: 1)
        headerView.number.textColor = UIColor(red: 226/255, green: 241/255, blue: 231/255, alpha: 1)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.rowHeight
    }
}

extension ClubsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
