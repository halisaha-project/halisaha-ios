//
//  AuthVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 28.04.2024.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func didTapRegisterButton(_ sender: Any) {
        navigateToRegister()
    }
    
    @IBAction func didTapAlreadyHaveAccountButton(_ sender: Any) {
        navigateToLogin()
    }
    
    private func navigateToRegister() {
        let vc = RegisterVC.instanceFromNib()
        appNavigationController.pushViewController(vc, animated: true)
    }
    
    private func navigateToLogin() {
        let vc = LoginVC.instanceFromNib()
        appNavigationController.pushViewController(vc, animated: true)
    }
}
