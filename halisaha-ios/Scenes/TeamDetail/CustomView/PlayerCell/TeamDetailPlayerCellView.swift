//
//  TeamDetailPlayerCellView.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 6.05.2024.
//

import UIKit

class TeamDetailPlayerCellView: UIView {
    @IBOutlet private var mainView: UIView!
    @IBOutlet private weak var playerNumberLabel: UILabel!
    @IBOutlet private weak var playerNameLabel: UILabel!
    @IBOutlet private weak var playerScoreBackgroundView: UIView!
    @IBOutlet private weak var playerScoreLabel: UILabel!
    @IBOutlet private weak var playerPositionBackgroundView: UIView!
    @IBOutlet private weak var playerPositionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed(TeamDetailPlayerCellView.className, owner: self)
        addSubview(mainView)
        mainView.frame = bounds
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapSelf))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc
    private func didTapSelf() {
        
    }
}
