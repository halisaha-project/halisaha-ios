//
//  TeamsCollectionViewCell.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 5.05.2024.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var teamImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.clipsToBounds = true
        arrowImageView.image = arrowImageView.image?.withRenderingMode(.alwaysTemplate)
        arrowImageView.tintColor = .primaryWhite // Yeni renk burada ayarlanıyor
    }
}


public extension NSObject {
    
    @objc final class var className: String {
        String(describing: self)
    }
}

