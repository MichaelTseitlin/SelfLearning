//
//  Extensions.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 21.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

extension String: MyProtocol {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCell.reuseId, for: indexPath) as? UserCell else {
            fatalError()
        }
        cell.buttonAction = {
            cell.indexPath = indexPath
            print(#line, #function, cell.indexPath)
        }
        cell.configure(data: self)
        return cell
    }
}
