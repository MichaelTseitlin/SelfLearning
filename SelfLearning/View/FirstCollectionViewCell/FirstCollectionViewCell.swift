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
    
    @IBAction func showPicture(sender: UIButton) {
        cellDelegate?.collectionCell(didSelect: self, buttonAction: .showPicture)
    }
    
    @IBAction func showVideo(sender: UIButton) {
        cellDelegate?.collectionCell(didSelect: self, buttonAction: .showVideo)
        
    }
    
    @IBAction func showSettings(sender: UIButton) {
        cellDelegate?.collectionCell(didSelect: self, buttonAction: .showSettings)
        
    }
    
    // MARK: - ConfigurableCell
    
    func configure(data: MyProtocol) {
        guard let data = data as? Int else { return }
        backgroundColor = .red
        textLabel.text = String(data)
    }
    
}
