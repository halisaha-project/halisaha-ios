//
//  TabBarPage.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 4.05.2024.
//

import UIKit.UIImage

enum TabBarPage: Int {
    case home
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        }
    }
    
    var image: UIImage? {
        var imageName: String = .empty
        
        switch self {
        case .home:
            imageName = "homeIcon"
        case .profile:
            imageName = "profileIcon"
        }
        
        return UIImage(named: imageName)
    }
}
