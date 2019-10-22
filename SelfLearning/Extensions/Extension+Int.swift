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
        guard let cell: FirstCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath) else {
            fatalError()
        }
        
        cell.configure(data: self)
        return cell
    }
}
