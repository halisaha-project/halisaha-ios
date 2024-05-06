//
//  TabBarVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 3.05.2024.
//

import UIKit

class TabBarVC: UITabBarController {
    
    private var selectedTab: TabBarPage {
        TabBarPage(rawValue: selectedIndex) ?? .home
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let index = tabBar.items?.firstIndex(of: item) else { return }
        selectedIndex = index
        
        //ilk eleman tabbar in kendisi
        if let tabBarItemView = tabBar.subviews[index + 1] as? UIControl,
           let imageView = tabBarItemView.subviews.compactMap({ $0 as? UIImageView }).first {
            addShadow(to: imageView)
            
            for (index, subview) in tabBar.subviews.enumerated() {
                if index != selectedIndex + 1,
                   let tabBarItemView = subview as? UIControl,
                   let imageView = tabBarItemView.subviews.compactMap({ $0 as? UIImageView }).first {
                    removeShadow(from: imageView)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primaryBlack
        tabBar.tintColor = .primaryBlack
        tabBar.barTintColor = .primaryBlack
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .primaryBlack
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        setupTabs()
        navigationController?.navigationBar.isHidden = true
        
    }
    
    private func setupTabs() {
        let homeVC = HomeVC.instanceFromNib()
//        homeVC.view.backgroundColor = .red
        homeVC.tabBarItem.title = TabBarPage.home.title
        homeVC.tabBarItem.image = TabBarPage.home.image
        
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .blue
        profileVC.tabBarItem.title = TabBarPage.profile.title
        profileVC.tabBarItem.image = TabBarPage.profile.image
        
        viewControllers = [homeVC, profileVC]
        tabBar.items?[safe: 0]?.title = ""
        tabBar.items?[safe: 0]?.title = ""
        tabBar.tintColor = .primaryBlue
        tabBar.items?[safe: 1]?.title = ""
        
        // İlk item'a gölge ekleme
        if let firstTabBarItemView = tabBar.subviews[0] as? UIControl,
           let firstImageView = firstTabBarItemView.subviews.compactMap({ $0 as? UIImageView }).first {
            addShadow(to: firstImageView)
        }
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 1))
        lineView.backgroundColor = UIColor.primaryGray
        lineView.layer.opacity = 0.3
        lineView.layer.shadowOffset = CGSize(width: 0, height: 2)
        lineView.layer.shadowColor = UIColor.primaryGray.cgColor
        lineView.layer.shadowOpacity = 0.2
        lineView.layer.shadowRadius = 1
        tabBar.layer.addSublayer(lineView.layer)
    }
    
    private func addShadow(to imageView: UIImageView) {
        imageView.layer.shadowColor = UIColor.primaryBlue.cgColor
        imageView.layer.shadowOpacity = 0.4
        imageView.layer.shadowOffset = CGSize(width: 0, height: 8)
        imageView.layer.shadowRadius = 7
    }
    
    private func removeShadow(from imageView: UIImageView) {
        imageView.layer.shadowOpacity = 0
        imageView.layer.shadowRadius = 0
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
