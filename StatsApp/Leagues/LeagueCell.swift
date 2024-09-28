//
//  LeagueCell.swift
//  FootballApp
//
//  Created by Davuthan Kurt on 17.09.2024.
//

import UIKit

class LeagueCell: UICollectionViewCell {
    var imageView: UIImageView!
    var leagueTitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        leagueTitle = UILabel()
        leagueTitle.translatesAutoresizingMaskIntoConstraints = false
        leagueTitle.text = ""
        leagueTitle.textAlignment = .center
        leagueTitle.font = UIFont.boldSystemFont(ofSize: 16)
        leagueTitle.numberOfLines = 2
        contentView.addSubview(leagueTitle)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7), // Image takes up 70% of the cell height

            // LeagueTitle constraints
            leagueTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            leagueTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            leagueTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            leagueTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
