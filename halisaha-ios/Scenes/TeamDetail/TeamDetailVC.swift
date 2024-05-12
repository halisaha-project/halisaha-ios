//
//  TeamDetailVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 6.05.2024.
//

import UIKit

class TeamDetailVC: UIViewController {

    @IBOutlet private weak var teamLogo: UIImageView!
    @IBOutlet private weak var matchsStackView: UIStackView!
    @IBOutlet private weak var matchsScrollView: UIScrollView!
    @IBOutlet private weak var playersScrollView: UIScrollView!
    @IBOutlet private weak var playersStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePlayer()
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
}

private extension TeamDetailVC {
    
    func updatePlayer() {
        for i in 0...10 {
            let playerCell = TeamDetailPlayerCellView()
            playersStackView.addArrangedSubview(playerCell)
            
            let matchCell = TeamDetailMatchCellView()
            matchsStackView.addArrangedSubview(matchCell)
        }
    }
}
