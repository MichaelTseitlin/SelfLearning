//
//  Extension+UICollectionViewCell.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 22.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    var collectionView: UICollectionView? {
        return superview as? UICollectionView
    }
    
    var indexPath: IndexPath? {
        return collectionView?.indexPath(for: self)
    }
}
