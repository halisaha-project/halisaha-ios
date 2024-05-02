//
//  UIViewController+Extensions.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 28.04.2024.
//

import UIKit

extension UIViewController {
    static func instanceFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            T(nibName: String(describing: self), bundle: nil)
        }
        
        return instanceFromNib()
    }
}
