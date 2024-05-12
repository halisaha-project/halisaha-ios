//
//  TeamMatchsListVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 10.05.2024.
//

import UIKit

class TeamMatchsListVC: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        for i in 0...10 {
            let playerCell = TeamDetailMatchCellView()
            stackView.addArrangedSubview(playerCell)
        }
    }
}
