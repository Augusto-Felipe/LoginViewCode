//
//  HomeScreen.swift
//  LoginViewCode
//
//  Created by Felipe Augusto Correia on 13/03/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var tableView: UITableView = {
        var tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.backgroundColor = .white
        tb.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        tb.register(SportTableViewCell.self, forCellReuseIdentifier: SportTableViewCell.identifier)
        return tb
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        self.addSubView()
        self.configTableViewConstraints()
        self.configBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        self.addSubview(tableView)
    }
    
    private func configBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    public func configTableView(delegate: UITableViewDelegate, datasource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = datasource
    }
    
    
    func configTableViewConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
