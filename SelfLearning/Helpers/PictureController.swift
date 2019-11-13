//
//  PictureController.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 13.11.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

class PictureController: SectionInterface {
    
    var pictures: [Picture]
    
    init(pictures: [Picture]) {
        self.pictures = pictures
    }
    
    func getObject(by indexPath: IndexPath) -> CollectionViewCompatible {
        return pictures[indexPath.row]
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return pictures.count
    }
    
    func getSectionHeader(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
    
    func insert<T>(_ item: T) where T : CollectionViewCompatible {
        print(#line, #function, "")
    }
    
    func sizeForItem(_ collectionView: UICollectionView) -> CGSize {
        let width = (collectionView.frame.width - 20) / 3
        return .init(width: width, height: width)
    }
    
    func referenceSizeForHeaderInSection(_ collectionView: UICollectionView) -> CGSize {
        return CGSize()
    }
}
