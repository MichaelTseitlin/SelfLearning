//
//  Extension+UICollectionView.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 22.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//
import UIKit

extension UICollectionView {
    
    func registerNibForCellClass(_ cellClass: ConfigurableCell.Type) {
        let cellReuseIdentifier = cellClass.reuseId
        let nibCell = UINib(nibName: cellReuseIdentifier, bundle: nil)
        register(nibCell, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
}
