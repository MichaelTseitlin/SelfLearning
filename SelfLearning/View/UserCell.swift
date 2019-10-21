//
//  UserCell.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 21.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell, ConfigurableCell {
    
    var indexPath = IndexPath()
    var buttonAction: (() -> ())?
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    @IBOutlet weak var textLabel: UILabel!
    
    func configure(data: MyProtocol) {
        guard let data = data as? String else { return }
        textLabel.text = data
        self.backgroundColor = .yellow
    }
    
    @IBAction func buttonPressed(sender: Any) {
        buttonAction?()
    }
}
