//
//  HomeVC.swift
//  halisaha-ios
//
//  Created by Bedirhan Turhan on 5.05.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var cellModels: [(String, String)] = [
        ("RealMadrid", "10 - MOO - MO "),
        ("RealMadrid", "10 - MOO - MO "),
        ("RealMadrid", "10 - MOO - MO "),
        ("RealMadrid", "10 - MOO - MO "),
        ("RealMadrid", "10 - MOO - MO "),
        ("RealMadrid", "10 - MOO - MO ")
        ]
    var cellHeights = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupCollectionView()
        calculateCellSizes()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(UINib(nibName: TeamsCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: "customCell")
        
        let cellWidth = UIScreen.main.bounds.width - 24
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize.width = cellWidth
        layout.sectionInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        
        collectionView.collectionViewLayout = layout
    }
    
    func calculateCellSizes() {
        cellModels.forEach { cellModel in
            let height = calculateFitNeedsCellHeight(width: UIScreen.main.bounds.width - 24, with: cellModel)
            cellHeights.append(height)
        }
//        needsCollectionViewHeight.constant = cellHeigts.first ?? .zero
        collectionView.reloadData()
    }
    
    func calculateFitNeedsCellHeight(
        width: CGFloat,
        with model: (String,String)
    ) -> CGFloat {
        let cell = TeamsCollectionViewCell.fromNib()
//        cell.model = model
        cell.titleLabel.text = model.0
        cell.descriptionLabel.text = model.1
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let fittingSize = CGSize(width: width, height: UIView.layoutFittingCompressedSize.height)
        let size = cell.contentView.systemLayoutSizeFitting(
            fittingSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow)
        return size.height
    }
}

extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! TeamsCollectionViewCell
        cell.titleLabel.text = cellModels[indexPath.row].0
        cell.descriptionLabel.text = cellModels[indexPath.row].1
        cell.cornerRadius = 8
        return cell
    }
}

extension HomeVC: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("Selected item at index: \(indexPath.item)")
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        .init(width: collectionView.frame.width, height: cellHeights[indexPath.row])
    }
}

public extension UIView {
    // swiftlint:disable all
    // MARK: - Properties
    final class var myNibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }

    final class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: myNibName, ofType: "nib") {
            return UINib(nibName: myNibName, bundle: nil)
        } else {
            return nil
        }
    }

    // MARK: - Methods
    final class func fromNib(bundle: Bundle = Bundle.main, nibNameOrNil: String? = nil) -> Self {
        return fromNib(bundle: bundle, nibNameOrNil: nibNameOrNil, type: self)
    }

    final class func fromNib<T: UIView>(bundle: Bundle = Bundle.main, nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(bundle: bundle, nibNameOrNil: nibNameOrNil, type: T.self)
        return v!
    }

    final class func fromNib<T: UIView>(bundle: Bundle = Bundle.main, nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let myNibName = nibNameOrNil {
            name = myNibName
        } else {
            name = myNibName
        }

        guard let nibViews = bundle.loadNibNamed(name, owner: nil, options: nil) else {
            #if DEBUG
                fatalError("cannot parse this value")
            #else
                return view
            #endif
        }

        for v in nibViews {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    // swiftlint:enable all

}
