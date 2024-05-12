//
//  ManageTeamVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 12.05.2024.
//

import UIKit

class ManageTeamVC: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        for i in 0...10 {
            let playerCell = ManageTeamPlayerCell()
            stackView.addArrangedSubview(playerCell)
        }
    }
}
