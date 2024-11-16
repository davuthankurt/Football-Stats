//
//  StatsTrackerCell.swift
//  StatsApp
//
//  Created by Davuthan Kurt on 7.11.2024.
//

import UIKit
import SnapKit

//Temporary Cell Code
class StatsTrackerCell: UICollectionViewCell {
    
    var cellTitle = UILabel()
    var tableView = UITableView()
    
    var viewModel: StatsTrackerCellViewModel? {
        didSet {
            viewModel?.delegate = self
            tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureContents()
        setConstraints()
        viewModel?.getPlayers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContents() {
        configureTitle()
        configureTableView()
    }
    
    private func configureTitle() {
        contentView.addSubview(cellTitle)
        
        cellTitle.textAlignment = .center
        cellTitle.font = UIFont(name: "AvenirNext-BoldItalic", size: 16)
        cellTitle.textColor = UIColor(red: 36/255, green: 54/255, blue: 66/255, alpha: 1)
        cellTitle.backgroundColor = UIColor(red: 98/255, green: 149/255, blue: 132/255, alpha: 1)
    }
    
    private func configureTableView(){
        contentView.addSubview(tableView)
        
        tableView.register(StatsTrackerPlayerCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
    }
    
    private func setConstraints(){
        
        cellTitle.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.top.leading.trailing.equalTo(contentView)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(cellTitle.snp.bottom)
            make.bottom.leading.trailing.equalTo(contentView)
        }
    }

    func configureCell(with header: String ) {
        cellTitle.text = header
    }
    
    func setViewModel(viewModel: StatsTrackerCellViewModel) {
        self.viewModel = viewModel
    }
}

extension StatsTrackerCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? StatsTrackerPlayerCell else { return UITableViewCell() }
        guard let viewModel = viewModel else { return cell }
        
        cell.configureCell(with: viewModel.cellForRowAt(index: indexPath), stats: viewModel.goalOrAssist, index: indexPath)
        
        return cell
    }
}


extension StatsTrackerCell: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension StatsTrackerCell: STCellViewModelDelegate {
    func handleViewModelOutput(_ output: STCellViewModelOutput) {
        switch output {
        case .showPlayers:
            tableView.reloadData()
        }
    }
}
