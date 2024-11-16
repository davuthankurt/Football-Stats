//
//  StatsTrackerViewController.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 29.10.2024.
//

import UIKit
import SnapKit

class StatsTrackerViewController: UIViewController {
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    
    var viewModel: StatsTrackerViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        setupConstraints()
        
        Task {
            await viewModel?.loadTopScorers()
            await viewModel?.loadTopAsisters()
        }
    }
}


extension StatsTrackerViewController {
    
    func configureContents(){
        configureView()
        configureCollectionView()
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureCollectionView(){
        view.addSubview(collectionView)
        
        collectionView.register(StatsTrackerCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(LeagueHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LeagueHeader.reuseIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupConstraints(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    static func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, env in
            
            let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 1
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(400)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
            ]
            
            section.orthogonalScrollingBehavior = .paging
            return section
        }
    }
}


extension StatsTrackerViewController: StatsTrackerViewModelDelegate {
    
    func handleViewModelOutput(_ output: StatsTrackerViewModelOutput) {
        DispatchQueue.main.async {
            switch output {
            case .showTopScorers, .showTopAssisters:
                self.collectionView.reloadData()
            }
        }
    }
}


extension StatsTrackerViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? StatsTrackerCell else { return UICollectionViewCell() }
        guard let viewModel = viewModel else { return cell }
        
        cell.setViewModel(viewModel: viewModel.injectCellViewModel(index: indexPath))
        cell.configureCell(with: viewModel.cellForItemAt(index: indexPath))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            fatalError("Unexpected element kind")
        }
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LeagueHeader.reuseIdentifier, for: indexPath) as! LeagueHeader
        headerView.backgroundColor = UIColor(red: 98/255, green: 149/255, blue: 132/255, alpha: 1)
        
        if let teamName = viewModel?.viewForSupplementaryElementOfKind(index: indexPath) {
            headerView.configure(with: teamName)
        }
        
        return headerView
    }
}
