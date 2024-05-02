//
//  UIColor+Extensions.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 28.04.2024.
//

import UIKit

extension UIColor {

    static var azBlueGrey = UIColor(named: "BlueGrey") ?? .clear

    convenience init(hex: Int, alpha: Double = 1.0) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat((hex) & 0xFF) / 255.0,
            alpha: CGFloat(255 * alpha) / 255
        )
    }
    
    convenience init(hex: String?, alpha: CGFloat = 1.0) {
        let whiteHexCode = "#FFFFFF"
        var hexSanitized = (hex ?? whiteHexCode).trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    var toHexString: String {
        cgColor.toHex ?? ""
    }
}
