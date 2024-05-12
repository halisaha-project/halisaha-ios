//
//  TeamDetailVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 6.05.2024.
//

import UIKit

class TeamDetailVC: UIViewController {

    @IBOutlet private weak var teamLogo: UIImageView!
    
    @IBOutlet weak var matchsTabView: UIView!
    @IBOutlet weak var playersTabView: UIView!
    @IBOutlet weak var bottomIndicatorView: UIView!
    
    @IBOutlet weak var matchsParentView: UIView!
    @IBOutlet private weak var matchsStackView: UIStackView!
    @IBOutlet weak var playersParentView: UIView!
    @IBOutlet private weak var playersStackView: UIStackView!
    
    var matchsConstraints = [NSLayoutConstraint]()
    var playersConstraints = [NSLayoutConstraint]()
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePlayer()
        setupUI()
    }
    @IBAction func didTapAllMatchsButton(_ sender: Any) {
        let vc = TeamMatchsListVC.instanceFromNib()
        appNavigationController.pushViewController(vc, animated: true)
    }
    @IBAction func didTapAllPlayersButton(_ sender: Any) {
        let vc = TeamPlayerListVC.instanceFromNib()
        appNavigationController.pushViewController(vc, animated: true)
    }
    @IBAction func didTapManageTeamButton(_ sender: Any) {
        let vc = ManageTeamVC.instanceFromNib()
        appNavigationController.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        let matchsTapAction = UITapGestureRecognizer(target: self, action: #selector(didTapMatchsView))
        matchsTabView.addGestureRecognizer(matchsTapAction)
        let playersTapAction = UITapGestureRecognizer(target: self, action: #selector(didTapPlayersView))
        playersTabView.addGestureRecognizer(playersTapAction)
        matchsConstraints = [
            bottomIndicatorView.leadingAnchor.constraint(equalTo: matchsTabView.leadingAnchor),
            bottomIndicatorView.trailingAnchor.constraint(equalTo: matchsTabView.trailingAnchor)
        ]
        playersConstraints = [
            bottomIndicatorView.leadingAnchor.constraint(equalTo: playersTabView.leadingAnchor),
            bottomIndicatorView.trailingAnchor.constraint(equalTo: playersTabView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(matchsConstraints)
    }
    
    @objc
    private func didTapMatchsView() {
        if selectedIndex == 1 {
            UIView.animate(withDuration: 0.3) {
                NSLayoutConstraint.activate(self.matchsConstraints)
                NSLayoutConstraint.deactivate(self.playersConstraints)
                self.matchsParentView.isHidden = false
                self.playersParentView.isHidden = true
                self.view.layoutIfNeeded()
            }
        }
        selectedIndex = 0
    }
    
    @objc
    private func didTapPlayersView() {
        if selectedIndex == 0 {
            UIView.animate(withDuration: 0.3) {
                NSLayoutConstraint.activate(self.playersConstraints)
                NSLayoutConstraint.deactivate(self.matchsConstraints)
                self.playersParentView.isHidden = false
                self.matchsParentView.isHidden = true
                self.view.layoutIfNeeded()
            }
        }
        selectedIndex = 1
    }
}

private extension TeamDetailVC {
    
    func updatePlayer() {
        for i in 0...3 {
            let playerCell = TeamDetailPlayerCellView()
            playersStackView.addArrangedSubview(playerCell)
            
            let matchCell = TeamDetailMatchCellView()
            matchsStackView.addArrangedSubview(matchCell)
        }
    }
}
