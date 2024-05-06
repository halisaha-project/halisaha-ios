//
//  ResetPasswordVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 1.05.2024.
//

import UIKit


class ResetPasswordVC: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }
    private func setupBackgroundImageView() {
        let backgroundImageColor = #colorLiteral(red: 0.007843137719, green: 0.007843137719, blue: 0.007843137719, alpha: 1)
        
        let topGradientLayer = CAGradientLayer()
        topGradientLayer.frame = CGRect(x: 0, y: 0, width: backgroundImageView.bounds.width, height: backgroundImageView.bounds.height * 0.3)
        topGradientLayer.colors = [UIColor.clear.cgColor, backgroundImageColor.cgColor]
        topGradientLayer.locations = [0.0, 1.0]
        
        let bottomGradientLayer = CAGradientLayer()
        bottomGradientLayer.frame = CGRect(x: 0, y: backgroundImageView.bounds.height * 0.7, width: backgroundImageView.bounds.width, height: backgroundImageView.bounds.height * 0.3)
        bottomGradientLayer.colors = [backgroundImageColor.cgColor, UIColor.clear.cgColor]
        bottomGradientLayer.locations = [0.0, 1.0]
        
        backgroundImageView.layer.addSublayer(topGradientLayer)
        backgroundImageView.layer.addSublayer(bottomGradientLayer)
    }
    
    private func setupTextField() {
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.primaryGray])
    }
}
