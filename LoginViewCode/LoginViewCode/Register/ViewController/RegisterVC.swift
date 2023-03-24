//
//  RegisterVC.swift
//  LoginViewCode
//
//  Created by Felipe Augusto Correia on 10/03/23.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    var auth: Auth?
    
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configtextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validateTextFields()
    }
}


extension RegisterVC: RegisterScreenProtocol {
    
    func registerButtonAction() {
        
        guard let register = self.registerScreen else {return}
        
        self.auth?.createUser(withEmail: register.getMail(), password: register.getPassword(), completion: { (resultado, error) in
            
            if error != nil {
                self.alert?.createAlert(titulo: "Atenção", mensagem: "Erro ao cadastrar.")
            } else {
                self.alert?.createAlert(titulo: "Parabéns", mensagem: "Usuário cadastrado com sucesso.", completion: {
                    
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
        
    }
    
    func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
