//
//  Extension+Int.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 21.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

extension Int: MyProtocol {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseId, for: indexPath) as? FirstCollectionViewCell else {
            fatalError()
        }
        
        cell.cellDelegate = self
        cell.configure(data: self)
        return cell
    }
}

extension Int: CollectionCellDelegate {
    func collectionCell(_ collectionView: UICollectionView, didSelect button: UIButton, for indexPath: IndexPath) {
        print(#line, #function, collectionView, indexPath)
    }
}
