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
    var customSectionModel = [CustomSectionModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = User.loadUserList()
        
        let sectionCreator = SectionCreator(items: items)
        customSectionModel = sectionCreator.customSectionModel
        
        collectionView.registerNibForCellClass(UserCell.self)
        collectionView.register(UINib(nibName: String(describing: UserCollectionReusableView.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: UserCollectionReusableView.self))
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return customSectionModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customSectionModel[section].model.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = customSectionModel[indexPath.section].model
        
        let cell = model[indexPath.row].collectionView(collectionView, cellForItemAt: indexPath, delegate: self)
  
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UserCollectionReusableView", for: indexPath) as! UserCollectionReusableView
            let section = customSectionModel[indexPath.section].section
            reusableView.headerLabel.text = String(section)
            return reusableView
        default:
            fatalError("Unexpected element kind")
        }
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
        if let indexPath = collectionView.indexPath(for: cell) {
            print(#line, #function, indexPath, buttonAction)
        }
    }
}
