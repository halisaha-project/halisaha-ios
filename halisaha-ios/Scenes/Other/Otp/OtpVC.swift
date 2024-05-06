//
//  OtpVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 2.05.2024.
//

import UIKit

protocol OTPDelegate: AnyObject {
    func didValidatedSuccessfully()
}

final class OtpVC: UIViewController {

    @IBOutlet weak var otpStackView: UIStackView!
    
    // MARK: Properties
    weak var delegate: OTPDelegate?
    let numberOfFields = 6
    var textFieldsCollection: [OTPTextField] = []
    var showsWarningColor = false
    
    //Colors
    let inactiveFieldBorderColor = UIColor.primaryGray // UIColor(white: 1, alpha: 0.3)
    let textBackgroundColor = UIColor.clear// UIColor(white: 1, alpha: 0.5)
    let activeFieldBorderColor = UIColor.primaryWhite // UIColor.white
    var remainingStrStack: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        addOTPFields()
    }
    
    private func setupStackView() {
        otpStackView.removeAllArrangedSubviews()
        otpStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private final func addOTPFields() {
        for index in 0..<numberOfFields {
            let field = OTPTextField()
            setupTextField(field)
            textFieldsCollection.append(field)
            //Adding a marker to previous field
            index != 0 ? (field.previousTextField = textFieldsCollection[index-1]) : (field.previousTextField = nil)
            //Adding a marker to next field for the field at index-1
            index != 0 ? (textFieldsCollection[index-1].nextTextField = field) : ()
        }
        textFieldsCollection[0].becomeFirstResponder()
    }
    
    //Customisation and setting OTPTextFields
    private final func setupTextField(_ textField: OTPTextField){
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        otpStackView.addArrangedSubview(textField)
//        textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 40).isActive = true
        textField.backgroundColor = textBackgroundColor
        textField.textAlignment = .center
        textField.adjustsFontSizeToFitWidth = false
//        textField.font = UIFont(name: "Kefa", size: 40)
        textField.textColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = inactiveFieldBorderColor.cgColor
        textField.keyboardType = .numberPad
        textField.autocorrectionType = .yes
        textField.textContentType = .oneTimeCode
    }
    
    //checks if all the OTPfields are filled
    private final func checkForValidity(){
        for fields in textFieldsCollection{
            if (fields.text == ""){
//                delegate?.didChangeValidity(isValid: false)
//                delegate?.didValidatedSuccessfully()
                return
            }
        }
//        delegate?.didChangeValidity(isValid: true)
        delegate?.didValidatedSuccessfully()
    }
    
    //gives the OTP text
    final func getOTP() -> String {
        var OTP = ""
        for textField in textFieldsCollection{
            OTP += textField.text ?? ""
        }
        return OTP
    }
    
    //set isWarningColor true for using it as a warning color
    final func setAllFieldColor(isWarningColor: Bool = false, color: UIColor){
        for textField in textFieldsCollection{
            textField.layer.borderColor = color.cgColor
        }
        showsWarningColor = isWarningColor
    }
    
    //autofill textfield starting from first
    private final func autoFillTextField(with string: String) {
        remainingStrStack = string.reversed().compactMap{String($0)}
        for textField in textFieldsCollection {
            if let charToAdd = remainingStrStack.popLast() {
                textField.text = String(charToAdd)
            } else {
                break
            }
        }
        checkForValidity()
        remainingStrStack = []
    }
}

//MARK: - TextField Handling
extension OtpVC: UITextFieldDelegate {
        
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if showsWarningColor {
            setAllFieldColor(color: inactiveFieldBorderColor)
            showsWarningColor = false
        }
        textField.layer.borderColor = activeFieldBorderColor.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkForValidity()
        textField.layer.borderColor = inactiveFieldBorderColor.cgColor
    }
    
    //switches between OTPTextfields
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange,
                   replacementString string: String) -> Bool {
        guard let textField = textField as? OTPTextField else { return true }
        if string.count > 1 {
            textField.resignFirstResponder()
            autoFillTextField(with: string)
            return false
        } else {
            if (range.length == 0){
                if textField.nextTextField == nil {
                    textField.text? = string
                    textField.resignFirstResponder()
                }else{
                    textField.text? = string
                    textField.nextTextField?.becomeFirstResponder()
                }
                return false
            }
            return true
        }
    }
    
}
