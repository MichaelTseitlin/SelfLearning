//
//  CollectionViewController.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 21.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

protocol MyProtocol {
    func collectionView (_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

protocol ConfigurableCell {
    func configure(data: MyProtocol)
}

protocol CollectionCellDelegate: class {
    func collectionCell(didSelect cell: UICollectionViewCell)
}

class CollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    var items = [[MyProtocol]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"],
                 [1,2,3,4,5,6,7,8,9,10]]
        collectionView.registerNibForCellClass(FirstCollectionViewCell.self)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = items[indexPath.section]
        
        let cell = model[indexPath.row] .collectionView(collectionView, cellForItemAt: indexPath)
        
        if let userCell = cell as? UserCell {
            userCell.cellDelegate = self
        } else if let firstCollectionViewCell = cell as? FirstCollectionViewCell {
            firstCollectionViewCell.cellDelegate = self
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 20, height: 100)
    }
}

extension CollectionViewController: CollectionCellDelegate {
   func collectionCell(didSelect cell: UICollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            print(#line, #function, indexPath)
        }
    }
}
