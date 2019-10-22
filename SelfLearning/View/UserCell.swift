//
//  UserCell.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 21.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell, ConfigurableCell {
    
    weak var cellDelegate: CollectionCellDelegate?

    @IBOutlet weak var textLabel: UILabel!
    
    func configure(data: MyProtocol) {
        guard let data = data as? String else { return }
        textLabel.text = data
        self.backgroundColor = .yellow
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        cellDelegate?.collectionCell(didSelect: self)
        
    }
}
