//
//  CGColor+Extensions.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 28.04.2024.
//

import UIKit

extension CGColor {
    var toHex: String? {
        guard let components = components else { return nil }
        let hexFormat = "#%02lX%02lX%02lX%02lX"
        
        if components.count == 2 {
            let value = components[0]
            let alpha = components[1]
            return String(
                format: hexFormat,
                lroundf(Float(alpha * 255)),
                lroundf(Float(value * 255)),
                lroundf(Float(value * 255)),
                lroundf(Float(value * 255))
            )
        }
        
        guard components.count == 4 else { return nil }
        
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alpha = components[3]
        
        let hexString = String(
            format: hexFormat,
            lroundf(Float(alpha * 255)),
            lroundf(Float(red * 255)),
            lroundf(Float(green * 255)),
            lroundf(Float(blue * 255))
        )
        
        return hexString
    }
}
