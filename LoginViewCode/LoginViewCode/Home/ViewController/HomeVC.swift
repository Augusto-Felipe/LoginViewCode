//
//  HomeVC.swift
//  LoginViewCode
//
//  Created by Felipe Augusto Correia on 13/03/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    
    var detailUser: [DetailUser] = [DetailUser(name: "Felipe", nameImage: "menino1"),
                                    DetailUser(name: "Caio", nameImage: "menino2"),
                                    DetailUser(name: "Gabi", nameImage: "menina1")
    
    ]
    
    var sports: [Sport] = [Sport(sportName: "Ciclismo", sportImageName: "ciclismo"),
                           Sport(sportName: "Yoga", sportImageName: "yoga"),
                           Sport(sportName: "Corrida", sportImageName: "corrida")
    
    ]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
        self.homeScreen?.configTableView(delegate: self, datasource: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.sportsData(sportsData: sports)
            return cell ?? UITableViewCell()
        }
        
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier) as? UserDetailTableViewCell
        cell?.setupCell(userDetail: self.detailUser[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
