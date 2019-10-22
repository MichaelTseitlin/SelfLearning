//
//  FirstCollectionViewCell.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 22.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    
    weak var cellDelegate: CollectionCellDelegate?
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func firstButtonAction(sender: UIButton) {
        cellDelegate?.collectionCell(didSelect: self)
    }
    
    @IBAction func secondButtonAction(sender: UIButton) {
        cellDelegate?.collectionCell(didSelect: self)
        
    }
    
    @IBAction func thirdButtonAction(sender: UIButton) {
        cellDelegate?.collectionCell(didSelect: self)
        
    }
    
    // MARK: - ConfigurableCell
    
    func configure(data: MyProtocol) {
        guard let data = data as? Int else { return }
        backgroundColor = .red
        textLabel.text = String(data)
    }
    
}
