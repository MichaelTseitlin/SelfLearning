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
        sortingUsers(items: items)
    }
    
    init(items: [CustomSectionModel]) {
        self.customSectionModel = items
    }
    
    // MARK: - Custom Methods
    
    func insert(item: [CollectionViewCompatible]) {
        
        var firstSymbols = Set<Character>()
        
        item.forEach { (user) in
            if let newUser = user as? User {
                _ = firstSymbols.insert(getFirstSymbol(word: newUser.firstName))
            }
        }
        
        firstSymbols.forEach { symbol in
            var words = [CollectionViewCompatible]()
            
            for word in item {
                if let newWord = word as? User {
                    if symbol == getFirstSymbol(word: newWord.firstName) {
                        words.append(word)
                    }
                }
            }
            
            let isNewItem = customSectionModel.enumerated().contains { (model) -> Bool in
                if model.element.section == symbol {
                    customSectionModel[model.offset].model.insert(item.first!, at: 0)
                    return true
                }
                return false
            }
            
            if !isNewItem {
                customSectionModel.append(CustomSectionModel(section: symbol, model: words))
                customSectionModel.sort { $0.section < $1.section}
            }
        }
    }
    
    private func sortingUsers(items: [CollectionViewCompatible]) {
        if let users = items as? [User] {
            
            var arrayOfNames: [CollectionViewCompatible] = []
            
            users.forEach { (user) in
                arrayOfNames.append(user)
            }
            
            createCollectionData(items: arrayOfNames)
        }
    }
    
    private func createCollectionData(items: [CollectionViewCompatible]) {
        var firstSymbols = Set<Character>()
        
        items.forEach { (user) in
            if let newUser = user as? User {
                _ = firstSymbols.insert(getFirstSymbol(word: newUser.firstName))
            }
        }
        
        firstSymbols.forEach { symbol in
            var words = [CollectionViewCompatible]()
            
            for word in items {
                if let newWord = word as? User {
                    if symbol == getFirstSymbol(word: newWord.firstName) {
                        words.append(word)
                    }
                }
            }
            
            self.customSectionModel.append(CustomSectionModel(section: symbol, model: words))
            
        }
        
        self.customSectionModel.sort { $0.section < $1.section }
    }
    
    private func getFirstSymbol(word: String) -> Character {
        return word[word.startIndex]
    }
}
