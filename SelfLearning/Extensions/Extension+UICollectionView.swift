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
        let cellReuseIdentifier = String(describing: cellClass.self)
        let nibCell = UINib(nibName: cellReuseIdentifier, bundle: nil)
        register(nibCell, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T? where T: ConfigurableCell {
        return dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T
    }
    
}
