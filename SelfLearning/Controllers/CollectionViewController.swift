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

class CollectionViewController: UIViewController {
    
    // MARK: - Properties
    var sectionController: SectionController
    
    // MARK: - Init
    required init?(coder: NSCoder) {
        sectionController = SectionController(items: User.loadUserList())
        super.init(coder: coder)
    }
    
    // MARK: - @IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerNibForCellClass(UserCell.self)
        collectionView.register(UINib(nibName: String(describing: UserCollectionReusableView.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: UserCollectionReusableView.self))
    }
    
    // MARK: - @IBActions
    @IBAction func addUser(_ sender: UIButton) {
        
        sectionController.insert(User(firstName: Lorem.firstName,
                                      lastName: Lorem.lastName,
                                      age: 25))
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionController.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionController.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = sectionController.getObject(by: indexPath)
        
        let cell = model.collectionView(collectionView, cellForItemAt: indexPath, delegate: self)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return sectionController.getSectionHeader(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
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
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        switch buttonAction {
        case .removeUser:
            sectionController.customSectionModel[indexPath.section].model.remove(at: indexPath.item)
            collectionView.deleteItems(at: [indexPath])
            
            if sectionController.customSectionModel[indexPath.section].model.isEmpty {
                sectionController.customSectionModel.remove(at: indexPath.section)
                collectionView.deleteSections(IndexSet(arrayLiteral: indexPath.section))
            }
        case .showMessage: break
        }
    }
}
