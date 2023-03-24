//
//  SportTableViewCell.swift
//  LoginViewCode
//
//  Created by Felipe Augusto Correia on 24/03/23.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    static let identifier: String = "SportTableViewCell"
    
    var sports: [Sport] = []
    
    lazy var sportTableViewCelScreen: SportTableViewCellScreen = {
        let view = SportTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.sportTableViewCelScreen.configCollectionViewDelegate(delegate: self, datasource: self)
        self.addElements()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.contentView.addSubview(sportTableViewCelScreen)
    }
    
    public func sportsData(sportsData: [Sport]) {
        self.sports = sportsData
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.sportTableViewCelScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportTableViewCelScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.sportTableViewCelScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.sportTableViewCelScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension SportTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell
        cell?.setupCell(sport: sports[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
