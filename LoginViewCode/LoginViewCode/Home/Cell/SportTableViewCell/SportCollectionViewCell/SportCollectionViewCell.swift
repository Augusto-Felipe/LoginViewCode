//
//  SportCollectionViewCell.swift
//  LoginViewCode
//
//  Created by Felipe Augusto Correia on 24/03/23.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SportCollectionViewCell"
    
    lazy var sportCollectionViewCellScreen: SportCollectionViewCellScreen = {
        let view = SportCollectionViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.contentView.addSubview(self.sportCollectionViewCellScreen)
    }
    
    public func setupCell(sport: Sport) {
        sportCollectionViewCellScreen.sportImageView.image = UIImage(named: sport.sportImageName)
        sportCollectionViewCellScreen.sportNameLabel.text = sport.sportName
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.sportCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportCollectionViewCellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.sportCollectionViewCellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.sportCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
