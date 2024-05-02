//
//  UIView+Layer.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 28.04.2024.
//

import UIKit

public extension UIView {

    // MARK: - Inspectable Variables
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0

        }
    }

    // MARK: - Safe Area Anchors
    var safeTopAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.topAnchor
    }

    var safeLeftAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.leftAnchor
    }

    var safeRightAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.rightAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.bottomAnchor
    }

    // MARK: - Round Specific Corners
    func roundCorner(_ corners: UIRectCorner, radius: CGFloat, clipsToBounds: Bool = true) {
        self.clipsToBounds = clipsToBounds
        layer.cornerRadius = radius
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
    }

    // MARK: - Gradient

    @discardableResult
    func gradient(firstColor: UIColor,
                  secondColor: UIColor,
                  locations: [NSNumber] = [0.0, 1.0],
                  startPoint: CGPoint = CGPoint(x: 0.5, y: 1.0),
                  endPoint: CGPoint = CGPoint(x: 0.5, y: 0.0)) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = .zero
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        layer.addSublayer(gradientLayer)
        gradientLayer.frame = bounds
        return gradientLayer
    }
    
    // MARK: - Adds a shadow
    func addShadow(
        color: UIColor = .black,
        alpha: Float = 0.04,
        x: CGFloat = 0,
        y: CGFloat = 4,
        blur: CGFloat = 14,
        spread: CGFloat = 0
    ) {
        layer.addShadow(color: color, alpha: alpha, x: x, y: y, blur: blur, spread: spread)
    }
}
