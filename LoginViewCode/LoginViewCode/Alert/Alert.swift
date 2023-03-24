//
//  Alert.swift
//  LoginViewCode
//
//  Created by Felipe Augusto Correia on 13/03/23.
//

import Foundation
import UIKit

class Alert:NSObject {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func createAlert(titulo: String, mensagem: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "OK", style: .cancel) { acao in
            completion?()
        }
        alertController.addAction(cancelar)
        self.controller.present(alertController, animated: true, completion: nil)
    }
}
