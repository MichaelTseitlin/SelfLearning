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
    func numberOfSections() -> Int
    func numberOfItemsInSection(section: Int) -> Int
    func getSectionHeader(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    func insert<T: CollectionViewCompatible>(_ item: T)
}

class SectionController: SectionInterface {
    
    var customSectionModel = [CustomSectionModel]()
    
    init(items: [CollectionViewCompatible]) {
        self.customSectionModel = SectionCreator(items: items).customSectionModel
    }
    
    func getObject(by indexPath: IndexPath) -> CollectionViewCompatible {
        return customSectionModel[indexPath.section].model[indexPath.row]
    }
    
    func numberOfSections() -> Int {
        return customSectionModel.count
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
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
    
    func insert<T>(_ item: T) where T : CollectionViewCompatible {
        let sectionCreator = SectionCreator(items: customSectionModel)
        sectionCreator.insert(item: [item])
        self.customSectionModel = sectionCreator.customSectionModel
    }
}

extension SectionController {
    private func showAlert(_ item: CollectionViewCompatible, in vc: UIViewController) {
        
        guard let user = item as? User else { return }
        
        let alert = UIAlertController(title: "\(user.firstName) \(user.lastName)", message: "was added!", preferredStyle: .alert)
        vc.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
