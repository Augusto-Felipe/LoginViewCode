//
//  SportCollectionViewCellScreen.swift
//  LoginViewCode
//
//  Created by Felipe Augusto Correia on 24/03/23.
//

import UIKit

class SportCollectionViewCellScreen: UIView {
    
    lazy var sportImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "person")
        return image
    }()
    
    lazy var sportNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Teste"
        label.textAlignment = .center 
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(self.sportImageView)
        self.addSubview(self.sportNameLabel)
    }
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
        
            self.sportImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.sportImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.sportImageView.heightAnchor.constraint(equalToConstant: 80),
            self.sportImageView.widthAnchor.constraint(equalToConstant: 80),
            
            self.sportNameLabel.topAnchor.constraint(equalTo: self.sportImageView.bottomAnchor, constant: 10),
            self.sportNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        
    }
}
