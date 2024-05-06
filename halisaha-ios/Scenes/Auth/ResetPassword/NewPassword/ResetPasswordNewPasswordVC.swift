//
//  ResetPasswordNewPasswordVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 3.05.2024.
//

import UIKit

class ResetPasswordNewPasswordVC: UIViewController {
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    
    private func setupTextFields() {
        newPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "New Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.primaryGray])
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(
            string: "Confirm Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.primaryGray])
    }
}
