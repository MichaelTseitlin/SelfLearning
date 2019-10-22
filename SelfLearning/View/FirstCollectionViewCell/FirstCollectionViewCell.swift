//
//  FirstCollectionViewCell.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 22.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell, ConfigurableCell {
        
    var cellDelegate: CollectionCellDelegate?
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func firstButtonAction(sender: UIButton) {
        guard let indexPath = indexPath,
        let collectionView = collectionView else { return }
        
        cellDelegate?.collectionCell(collectionView, didSelect: sender, for: indexPath)
    }
    
    @IBAction func secondButtonAction(sender: UIButton) {
        guard let indexPath = indexPath,
        let collectionView = collectionView else { return }

        cellDelegate?.collectionCell(collectionView, didSelect: sender, for: indexPath)
    }
    
    @IBAction func thirdButtonAction(sender: UIButton) {
        guard let indexPath = indexPath,
        let collectionView = collectionView else { return }

        cellDelegate?.collectionCell(collectionView, didSelect: sender, for: indexPath)
    }
    
    // MARK: - ConfigurableCell
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    func configure(data: MyProtocol) {
        guard let data = data as? Int else { return }
        backgroundColor = .red
        textLabel.text = String(data)
    }
    
}
