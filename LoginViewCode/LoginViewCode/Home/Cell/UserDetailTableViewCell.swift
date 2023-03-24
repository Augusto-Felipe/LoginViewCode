//
//  UserDetailTableViewCell.swift
//  LoginViewCode
//
//  Created by Felipe Augusto Correia on 13/03/23.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var userDetailView: UserDetailView = {
        let view = UserDetailView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.configDescriptionCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.contentView.addSubview(self.userDetailView)
    }
    
    func setupCell(userDetail: DetailUser) {
        self.userDetailView.nameLabel.text = userDetail.name
        self.userDetailView.userImageView.image = UIImage(named: userDetail.nameImage)
    }
    
    private func configDescriptionCellConstraints() {
        self.userDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
