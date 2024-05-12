//
//  TeamMatchDetailVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 11.05.2024.
//

import UIKit

class TeamMatchDetailVC: UIViewController {
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var voteView: UIView!
    @IBOutlet weak var bottomIndicatorView: UIView!
    
    @IBOutlet weak var voteMainView: UIView!
    @IBOutlet weak var votedPlayerList: UIStackView!
    @IBOutlet weak var didntVotedMainView: UIView!
    
    @IBOutlet weak var detailMainView: UIStackView!
    @IBOutlet weak var matchDetailMainView: UIStackView!
    @IBOutlet weak var formationMainView: UIView!
    
    var detailConstraints = [NSLayoutConstraint]()
    var voteConstraints = [NSLayoutConstraint]()
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(didTapDetailView))
        detailView.addGestureRecognizer(tapAction)
        let voteTapAction = UITapGestureRecognizer(target: self, action: #selector(didTapVoteView))
        voteView.addGestureRecognizer(voteTapAction)
        detailConstraints = [
            bottomIndicatorView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor),
            bottomIndicatorView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor)
        ]
        voteConstraints = [
            bottomIndicatorView.leadingAnchor.constraint(equalTo: voteView.leadingAnchor),
            bottomIndicatorView.trailingAnchor.constraint(equalTo: voteView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(detailConstraints)
        
        for i in 0...10 {
            let playerCell = TeamDetailPlayerCellView()
            votedPlayerList.addArrangedSubview(playerCell)
        }
    }
    
    @objc
    func didTapDetailView() {
        if selectedIndex == 1 {
            UIView.animate(withDuration: 0.3) {
                NSLayoutConstraint.activate(self.detailConstraints)
                NSLayoutConstraint.deactivate(self.voteConstraints)
                self.voteMainView.isHidden = true
                self.detailMainView.isHidden = false
                self.view.layoutIfNeeded()
            }
        }
        selectedIndex = 0
    }
    
    @objc
    func didTapVoteView() {
        if selectedIndex == 0 {
            UIView.animate(withDuration: 0.3) {
                NSLayoutConstraint.activate(self.voteConstraints)
                NSLayoutConstraint.deactivate(self.detailConstraints)
                self.voteMainView.isHidden = false
                self.detailMainView.isHidden = true
                self.view.layoutIfNeeded()
            }
        }
        selectedIndex = 1
    }
}
