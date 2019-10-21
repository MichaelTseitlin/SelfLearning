//
//  CollectionViewController.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 21.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

protocol MyProtocol {}

class CollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    var items = [MyProtocol]()
    private var models = [CellConfigurator]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
        settingData(by: items)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type(of: model).reuseId, for: indexPath)
        
        model.configure(cell: cell)
        
        return cell
    }
    
    private func settingData(by items: [MyProtocol]) {

        items.forEach { item in
            guard let stringItem = item as? String else { return }
            models.append(CollectionCellConfigurator<UserCell, String>(item: stringItem))
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 20, height: 100)
    }
}
