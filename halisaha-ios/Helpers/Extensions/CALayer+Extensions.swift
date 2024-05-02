//
//  CALayer+Extensions.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 28.04.2024.
//

import UIKit

extension CALayer {
    
    func addShadow(
        color: UIColor = .black,
        alpha: Float = 0,
        x: CGFloat = 0,
        y: CGFloat = 0,
        blur: CGFloat = 0,
        spread: CGFloat = 0
    ) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
