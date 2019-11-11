//
//  UserCell.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 04.11.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell, ConfigurableCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var cellDelegate: CollectionCellDelegate?
    
    func configure(data: CollectionViewCompatible) {
        if let user = data as? User {
            fullNameLabel.text = "\(user.firstName) \(user.lastName)"
            ageLabel.text = String(user.age)
            backgroundColor = .lightGray
        }
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
        cellDelegate?.collectionCell(didSelect: self, buttonAction: .showMessage(self))
//        cellDelegate?.collectionCell(didSelect: self, button: sender)
    }
    
    @IBAction func removeUser(_ sender: UIButton) {
        cellDelegate?.collectionCell(didSelect: self, buttonAction: .removeUser(self))
//        cellDelegate?.collectionCell(didSelect: self, button: sender)
    }
    
}
