//
//  CollectionViewController.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 21.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

protocol CollectionViewCompatible {
    func collectionView (_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, delegate: CollectionCellDelegate) -> UICollectionViewCell
}

protocol ConfigurableCell {
    func configure(data: CollectionViewCompatible)
}

protocol CollectionCellDelegate: class {
    func collectionCell(didSelect cell: UICollectionViewCell, buttonAction: ButtonAction)
}

enum ButtonAction {
    case showMessage(UserCell)
    case removeUser(UserCell)
}

class CollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    var items = [CollectionViewCompatible]()
    var sectionController: SectionController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = User.loadUserList()
        
        sectionController = SectionController(items: items, collectionView: collectionView)
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionController?.numberOfSections(in: collectionView) ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionController?.numberOfItemsInSection(collectionView, section: section) ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = sectionController?.getObject(by: indexPath) else { return UICollectionViewCell() }
        
        let cell = model.collectionView(collectionView, cellForItemAt: indexPath, delegate: self)
  
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return sectionController?.getSectionHeader(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath) ?? UICollectionReusableView()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 20, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: 51)
    }
}

// MARK: - CollectionCellDelegate
extension CollectionViewController: CollectionCellDelegate {
    func collectionCell(didSelect cell: UICollectionViewCell, buttonAction: ButtonAction) {
    }
}
