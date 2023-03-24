//
//  ViewController.swift
//  LoginViewCode
//
//  Created by Felipe Augusto Correia on 05/03/23.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    
    var auth: Auth?
    
    var alert: Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.view = self.loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validateTextFields()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
}

extension LoginVC: LoginScreenProtocol {
    
    func actionLoginButton() {
        
        
        let vc = HomeVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
//        guard let login = self.loginScreen else {return}
//
//        self.auth?.signIn(withEmail: login.getMail(), password: login.getPassword(), completion: { usuario, error in
//
//            if error != nil {
//                self.alert?.createAlert(titulo: "Dados incorretos.", mensagem: "Verifique e tente novamente.")
//            } else {
//
//                if usuario == nil {
//                    self.alert?.createAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado, tente novamente mais tarde.")
//                } else {
//                    self.alert?.createAlert(titulo: "Parabéns", mensagem: "Usuário logado com sucesso.")
//                }
//            }
//        })
    }
    
    func actionResgiterButton() {
        let vc = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
