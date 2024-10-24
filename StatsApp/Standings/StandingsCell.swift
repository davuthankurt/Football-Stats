//
//  StandingsCell.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 8.10.2024.
//

import UIKit
//Temporary Standings Cell.
class StandingsCell: UITableViewCell {
    var rank = UILabel()
//    var form = UILabel()
    var points = UILabel()
    var teamName = UILabel()
//    var records = UILabel()
    var goalsDiff = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(rank)
        contentView.addSubview(teamName)
        contentView.addSubview(points)
        contentView.addSubview(goalsDiff)
//        contentView.addSubview(form)
//        contentView.addSubview(records)
        
        rank.text = "R"
        rank.textAlignment = .left
        teamName.text = "Team"
        teamName.textAlignment = .left
        points.text = "P"
        points.textAlignment = .center
        goalsDiff.text = "Av"
        goalsDiff.textAlignment = .center
//        form.textAlignment = .center
//        records.textAlignment = .center
    }

    private func setupConstraints() {
        rank.translatesAutoresizingMaskIntoConstraints = false
        teamName.translatesAutoresizingMaskIntoConstraints = false
        points.translatesAutoresizingMaskIntoConstraints = false
        goalsDiff.translatesAutoresizingMaskIntoConstraints = false
//        form.translatesAutoresizingMaskIntoConstraints = false
//        records.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            rank.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            rank.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rank.widthAnchor.constraint(equalToConstant: 30),
            teamName.leadingAnchor.constraint(equalTo: rank.trailingAnchor, constant: 8),
            teamName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamName.widthAnchor.constraint(equalToConstant: 150),
            points.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            points.leadingAnchor.constraint(equalTo: goalsDiff.trailingAnchor, constant: 8),
            points.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            points.widthAnchor.constraint(equalToConstant: 30),
            goalsDiff.trailingAnchor.constraint(equalTo: points.leadingAnchor, constant: -8),
            goalsDiff.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            goalsDiff.widthAnchor.constraint(equalToConstant: 30),
//            form.leadingAnchor.constraint(equalTo: team.trailingAnchor, constant: 8),
//            form.trailingAnchor.constraint(equalTo: goalsDiff.leadingAnchor, constant: -8),
//            form.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            // Records Label
        ])
    }
    
    public func configureCells(with team: StandingsCellPresentation) {
        rank.text = "\(team.rank)."
        teamName.text = team.team
//        form.text = team.form
        goalsDiff.text = "\(team.goalsDiff)"
        points.text = "\(team.points)"
//        records.text = "\(team.records.win)"
    }
}
