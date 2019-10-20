//
//  CollectionViewDataSource.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 20.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class CollectionViewDataSource<Model>: NSObject, UICollectionViewDataSource {
    typealias CellConfiguration = (Model, UICollectionViewCell) -> Void
    
    var models: [Model]
    private let reuseIdentifier: String
    private let cellConfiguration: CellConfiguration
    
    init(models: [Model],
         reuseIdentifier: String,
         cellConfiguration: @escaping CellConfiguration) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfiguration = cellConfiguration
    }
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cellConfiguration(model, cell)
        
        return cell
    }
}
