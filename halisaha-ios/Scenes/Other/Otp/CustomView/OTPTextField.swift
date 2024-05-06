//
//  OTPTextField.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 2.05.2024.
//

import UIKit

class OTPTextField: UITextField {
    
    weak var previousTextField: OTPTextField?
    weak var nextTextField: OTPTextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    override public func deleteBackward(){
        text = ""
        previousTextField?.becomeFirstResponder()
    }
    
    func commonInit() {
        
    }
}
