//
//  CustomCollectionViewController.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 18.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

enum TypeOfCell: String, CustomStringConvertible {
    
    case FirstCollectionViewCell
    case SecondCollectionViewCell
    
    var description: String {
        return self.rawValue
    }
}

class CustomCollectionViewController: UICollectionViewController {
    
    var items: [String] = []
    var reuseIdentifier: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell(by: reuseIdentifier)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let reuseIdentifier = reuseIdentifier else { return UICollectionViewCell() }
        
        let cellIdentifier = TypeOfCell(rawValue: reuseIdentifier)
        
        switch cellIdentifier {
        case .FirstCollectionViewCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FirstCollectionViewCell
            cell.textLabel.text = items[indexPath.row]
            return cell
        case .SecondCollectionViewCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SecondCollectionViewCell
            cell.textLabel.text = items[indexPath.row]
            return cell
        case .none:
            return UICollectionViewCell()
        }
    }
    
    // MARK: - Custom Methods
    
    private func registerCell(by identifier: String?) {
        guard let reuseIdentifier = identifier else { return }
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CustomCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: 200)
    }
}
