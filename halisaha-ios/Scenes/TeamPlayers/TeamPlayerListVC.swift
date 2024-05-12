//
//  TeamPlayerListVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 8.05.2024.
//

import UIKit

class TeamPlayerListVC: UIViewController {
    
    @IBOutlet private weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        for i in 0...10 {
            let playerCell = TeamDetailPlayerCellView()
            stackView.addArrangedSubview(playerCell)
        }
    }
}
