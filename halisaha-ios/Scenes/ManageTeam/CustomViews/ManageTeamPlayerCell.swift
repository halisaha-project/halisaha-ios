//
//  ManageTeamPlayerCell.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 12.05.2024.
//

import UIKit

class ManageTeamPlayerCell: UIView {
    
    @IBOutlet var mainView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed(ManageTeamPlayerCell.className, owner: self)
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
