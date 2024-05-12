//
//  TeamPlayerDetailVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 11.05.2024.
//

import UIKit

class TeamPlayerDetailVC: UIViewController {
    
    @IBOutlet weak var progressView: MKMagneticProgress!
    @IBOutlet weak var matchsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.setProgress(progress: 0.3, animated: true)
        progressView.autoresizingMask = .flexibleHeight
        setupUI()
    }
    
    private func setupUI() {
        for i in 0...10 {
            let playerCell = TeamDetailMatchCellView()
            matchsStackView.addArrangedSubview(playerCell)
        }
    }
}
