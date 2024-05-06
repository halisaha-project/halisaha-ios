//
//  UIStackView+Extensions.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 2.05.2024.
//

import UIKit

public extension UIStackView {

    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
