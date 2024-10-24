//
//  ViewController.swift
//  FootballApp
//
//  Created by Davuthan Kurt on 3.09.2024.
//

import UIKit

class LeaguesViewController: UIViewController {
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var leagueList: [LeaguePresentation] = []
    
    var viewModel: LeaguesViewModelProtocol? {
        didSet{
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        viewModel?.load()
    }
}


extension LeaguesViewController {
    func configureContents (){
        configureView()
        configureCollectionView()
        configureCell()
    }
    func configureCell(){
        collectionView.register(LeagueCell.self, forCellWithReuseIdentifier: "Cell")
    }
    func configureView(){
        view.backgroundColor = .white
    }
    func configureCollectionView() {

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension LeaguesViewController: LeaguesViewModelDelegate {
    func handleViewModelOutput(_ output: LeaguesViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .showLeagues(let leagueList):
            self.leagueList = leagueList
            collectionView.reloadData()
        }
    }
    
    func navigate(to route: LeaguesViewRoute) {
        switch route {
        case .standings(let viewModel):
            let viewController = StandingsBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
}

extension LeaguesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 32
        let cellWidth = (collectionView.frame.width - padding) / 2

        
        return CGSize(width: cellWidth, height: cellWidth * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}


extension LeaguesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! LeagueCell
        
        cell.backgroundColor = .cyan
        
        if let league = viewModel?.cellForItemAt(index: indexPath) {
            cell.configureCell(with: league)
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItemsInSection(section: section)
    }
    
}

extension LeaguesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        viewModel?.didSelectRowAt(index: indexPath)
    }
}

