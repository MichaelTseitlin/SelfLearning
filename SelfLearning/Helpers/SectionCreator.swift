//
//  SectionCreator.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 05.11.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import Foundation

class SectionCreator {
    
    // MARK: - Properties
    var customSectionModel = [CustomSectionModel]()
    
    init(items: [CollectionViewCompatible]) {
        createSectionModel(by: items)
    }
    
    init(items: [CustomSectionModel]) {
        self.customSectionModel = items
    }
    
    // MARK: - Custom Methods
    
    func insert(item: [CollectionViewCompatible]) {
        createDictionary(by: item) { (section, model) in
            
            let isNewItem = customSectionModel.enumerated().contains { (model) -> Bool in
                if model.element.section == section {
                    customSectionModel[model.offset].model.insert(item.first!, at: 0)
                    return true
                }
                return false
            }
            
            if !isNewItem {
                customSectionModel.append(CustomSectionModel(section: section, model: model))
                customSectionModel.sort { $0.section < $1.section}
            }
        }
    }
   
    private func createSectionModel(by items: [CollectionViewCompatible]) {
        
        createDictionary(by: items) { (section, model) in
            self.customSectionModel.append(CustomSectionModel(section: section, model: model))
            self.customSectionModel.sort { $0.section < $1.section }
        }
    }
    
    private func createDictionary(by items: [CollectionViewCompatible], completion: (String, [CollectionViewCompatible]) -> ()) {
        if let user = items as? [User] {
            let usersByLetter = Dictionary(grouping: user, by: { getFirstSymbol(word: $0.firstName).uppercased() })
            usersByLetter.forEach {
                completion($0.key, $0.value)
            }
        }
    }
    
    private func getFirstSymbol(word: String) -> Character {
        return word[word.startIndex]
    }
}
