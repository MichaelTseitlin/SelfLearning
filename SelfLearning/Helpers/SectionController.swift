//
//  SectionController.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 05.11.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

protocol SectionInterface {
    func getObject(by indexPath: IndexPath) -> CollectionViewCompatible
    func numberOfSections(in collectionView: UICollectionView) -> Int
    func numberOfItemsInSection(_ collectionView: UICollectionView, section: Int) -> Int
    func getSectionHeader(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    func insertItem(at indexPath: IndexPath)
}

class SectionController: SectionInterface {
    
    var customSectionModel = [CustomSectionModel]()
    
    init(items: [CollectionViewCompatible]) {
        self.customSectionModel = SectionCreator(items: items).customSectionModel
    }
    
    func getObject(by indexPath: IndexPath) -> CollectionViewCompatible {
        return customSectionModel[indexPath.section].model[indexPath.row]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return customSectionModel.count
    }
    
    func numberOfItemsInSection(_ collectionView: UICollectionView, section: Int) -> Int {
        return customSectionModel[section].model.count
    }
    
    func getSectionHeader(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UserCollectionReusableView", for: indexPath) as! UserCollectionReusableView
            let section = customSectionModel[indexPath.section].section
            reusableView.headerLabel.text = String(section)
            return reusableView
        default:
            fatalError("Unexpected element kind")
        }
    }
    
    func insertItem(at indexPath: IndexPath) {
        customSectionModel[indexPath.section].model.append(User())
    }
}
