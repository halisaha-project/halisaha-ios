//
//  RegisterVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 28.04.2024.
//

import UIKit

final class RegisterVC: UIViewController {
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var mailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImageView()
        setupTextFields()
    }
    
    private func setupBackgroundImageView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: backgroundImageView.bounds.height * 0.5, width: backgroundImageView.bounds.width, height: backgroundImageView.bounds.height * 0.5)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1.0] // Gradyanın netlik derecesini ayarlayabilirsiniz
        backgroundImageView.layer.addSublayer(gradientLayer)
    }
    
    private func setupTextFields() {
        mailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.primaryGray])
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Şifre",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.primaryGray])
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "Şifre Doğrulama",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.primaryGray])
    }
}
