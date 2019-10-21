//
//  CollectionCellConfigurator.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 21.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    func configure(data: MyProtocol)
}

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView)
}

class CollectionCellConfigurator<CellType: ConfigurableCell, Model: MyProtocol>: CellConfigurator {
    
    static var reuseId: String {
        return String(describing: CellType.self)
    }
    
    let item: Model
    
    init(item: Model) {
        self.item = item
    }

    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item)
    }
}
