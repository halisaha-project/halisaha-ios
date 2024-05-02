//
//  UIView+Extensions.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 28.04.2024.
//

import UIKit

extension UIView {
    // Factory methods

    var isVisible: Bool {
        return !self.isHidden
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    static func createNavigationTitleView(title: String) -> UIView {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth - 150, height: 44))
        let titleLabel = UILabel(frame: titleView.frame)
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "AllianzNeo-Regular", size: 19)
        
        titleLabel.textColor = UIColor.white
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.text = title
        titleLabel.accessibilityIdentifier = "navigationbar_title_label"
        titleLabel.isAccessibilityElement = true
        titleView.addSubview(titleLabel)
        
        return titleView
    }
    
    static func createNavigationTitleView(title: String, subtitle: String) -> UIView {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -8, width: 0, height: 0))
        
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "AllianzNeo-Regular", size: 19)
        titleLabel.text = title
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 14, width: 0, height: 0))
        subtitleLabel.backgroundColor = .clear
        subtitleLabel.textColor = UIColor(white: 1, alpha: 0.7)
        subtitleLabel.font = UIFont(name: "AllianzNeo-Regular", size: 15)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        
        let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width
        
        if widthDiff < 0 {
            let newX = widthDiff / 2
            subtitleLabel.frame.origin.x = abs(newX)
        } else {
            let newX = widthDiff / 2
            titleLabel.frame.origin.x = newX
        }
        
        return titleView
    }
    
    func createDottedLine(width: CGFloat, color: CGColor) {
        let caShapeLayer = CAShapeLayer()
        caShapeLayer.strokeColor = color
        caShapeLayer.lineWidth = width
        caShapeLayer.lineDashPattern = [5, 4]
        let cgPath = CGMutablePath()
        let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width, y: 0)]
        cgPath.addLines(between: cgPoint)
        caShapeLayer.path = cgPath
        layer.addSublayer(caShapeLayer)
    }
    
    func setupShadow(radius: CGFloat, opacity: Float, color: CGColor, offSet: CGSize) {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color
        self.layer.shadowOffset = offSet
    }
    
    func makeCircle() {
        self.layer.cornerRadius = self.layer.bounds.width / 2
    }
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }

    func createImageURL(fileName: String?) -> URL? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }

        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            if let image = UIGraphicsGetImageFromCurrentImageContext() {
                guard let imageData = image.jpegData(compressionQuality: 1.0) else {
                    return nil
                }

                let temporaryDirectory = NSTemporaryDirectory()
                let fileName = (fileName ?? "") + ".jpg"
                let fileURL = URL(fileURLWithPath: temporaryDirectory).appendingPathComponent(fileName)
                
                do {
                    try imageData.write(to: fileURL)
                    return fileURL
                } catch {
                    return nil
                }
            }
        }
        return nil
    }
}

extension UIView {
    @IBInspectable var borderWidthCustom: CGFloat {
        get {
            self.layer.borderWidth
        }
        set(value) {
            self.layer.borderWidth = value
        }
    }
    
    @IBInspectable var borderColorCustom: UIColor {
        get {
            guard let cgColor = self.layer.borderColor else {
                return .clear
            }
            
            return UIColor(cgColor: cgColor)
        }
        set(value) {
            self.layer.borderColor = value.cgColor
        }
    }
}

extension UIView {
    func addBottomDashedLine(color: UIColor, strokeLength: NSNumber, gapLength: NSNumber, width: CGFloat) {
        let leftPoint = CGPoint(x: self.frame.minX, y: self.bounds.maxY)
        let rightPoint = CGPoint(x: self.frame.maxX, y: self.bounds.maxY)
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = width
        shapeLayer.lineDashPattern = [strokeLength, gapLength]
        
        let path = CGMutablePath()
        path.addLines(between: [leftPoint, rightPoint])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
