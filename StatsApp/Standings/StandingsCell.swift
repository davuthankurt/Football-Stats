//
//  StandingsCell.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 8.10.2024.
//

import UIKit
//Temporary Standings Cell.
class StandingsCell: UITableViewCell {
    public var rank = UILabel()
//    var form = UILabel()
    var points = UILabel()
    var team = UILabel()
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
        contentView.addSubview(team)
        contentView.addSubview(points)
        contentView.addSubview(goalsDiff)
//        contentView.addSubview(form)
//        contentView.addSubview(records)
        
        // Eğer ihtiyaç varsa label'ların stilini burada ayarlayabilirsin
        rank.text = "R"
        rank.textAlignment = .left
        team.text = "Team"
        team.textAlignment = .left
        points.text = "P"
        points.textAlignment = .center
        goalsDiff.text = "Av"
        goalsDiff.textAlignment = .center
//        form.textAlignment = .center
//        records.textAlignment = .center
    }

    private func setupConstraints() {
        rank.translatesAutoresizingMaskIntoConstraints = false
        team.translatesAutoresizingMaskIntoConstraints = false
        points.translatesAutoresizingMaskIntoConstraints = false
        goalsDiff.translatesAutoresizingMaskIntoConstraints = false
//        form.translatesAutoresizingMaskIntoConstraints = false
//        records.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Rank Label
            rank.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            rank.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rank.widthAnchor.constraint(equalToConstant: 30),
            
            // Team Label
            team.leadingAnchor.constraint(equalTo: rank.trailingAnchor, constant: 8),
            team.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            team.widthAnchor.constraint(equalToConstant: 150),
            
            // Points Label
            points.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            points.leadingAnchor.constraint(equalTo: goalsDiff.trailingAnchor, constant: 8),
            points.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            points.widthAnchor.constraint(equalToConstant: 30),
            
            // GoalsDiff Label
            goalsDiff.trailingAnchor.constraint(equalTo: points.leadingAnchor, constant: -8),
            goalsDiff.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            goalsDiff.widthAnchor.constraint(equalToConstant: 30),
            
            // Form Label
//            form.leadingAnchor.constraint(equalTo: team.trailingAnchor, constant: 8),
//            form.trailingAnchor.constraint(equalTo: goalsDiff.leadingAnchor, constant: -8),
//            form.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Records Label
        ])
    }
}
