//
//  CustomCollectionViewController.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 18.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

protocol MyProtocol {}

class CustomCollectionViewController: UICollectionViewController {

    var dataSource: CollectionViewDataSource<MyProtocol>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Custom Methods
    
    private func registerCell(by identifier: String?) {
        guard let reuseIdentifier = identifier else { return }
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func itemsDidLoad(items: [MyProtocol], reuseIdentifier: String) {
        let dataSource = CollectionViewDataSource(
        models: items,
        reuseIdentifier: reuseIdentifier)
        { (item, cell) in
            cell.backgroundColor = .blue
            print(#line, #function, item)
        }
        
        self.dataSource = dataSource
        collectionView.dataSource = dataSource
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CustomCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
}

extension String: MyProtocol {}
extension Int: MyProtocol {}
