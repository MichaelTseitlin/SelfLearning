//
//  PictureCell.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 13.11.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell, ConfigurableCell {
    
    @IBOutlet weak var picture: UIImageView!
    
    func configure(data: CollectionViewCompatible)  {
        if let picture = data as? Picture {
            self.picture.image = picture.picture
        }
    }
    
}
