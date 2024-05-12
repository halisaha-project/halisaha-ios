//
//  TeamDetailMatchCellView.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 6.05.2024.
//

import UIKit

class TeamDetailMatchCellView: UIView {

    @IBOutlet private var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed(TeamDetailMatchCellView.className, owner: self)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapSelf))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc
    private func didTapSelf() {
        let vc = TeamMatchDetailVC.instanceFromNib()
        appNavigationController.pushViewController(vc, animated: true)
    }
}
