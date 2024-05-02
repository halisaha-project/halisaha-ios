//
//  LoginVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 28.04.2024.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    
    @IBAction func didTapForgotPasswordButton(_ sender: Any) {
        navigateToForgotPassword()
    }
    
    private func navigateToForgotPassword() {
        let vc = ResetPasswordVC.instanceFromNib()
        appNavigationController.pushViewController(vc, animated: true)
    }
    
    private func setupTextField() {
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.primaryGray])
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.primaryGray])
    }
}
