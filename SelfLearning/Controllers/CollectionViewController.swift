//
//  CollectionViewController.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 21.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

protocol ModelProtocol {
    func collectionView (_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, delegate: CollectionCellDelegate) -> UICollectionViewCell
}

protocol ConfigurableCell {
    func configure(data: ModelProtocol)
}

protocol CollectionCellDelegate: class {
    func collectionCell(didSelect cell: UICollectionViewCell, buttonAction: ButtonAction)
}

enum ButtonAction {
    case showMessage(UserCell)
    case removeUser(UserCell)
}

class CollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    var items = [ModelProtocol]()
    var collectionViewSource = [Character : [String]]()
    var collectionViewHeaders = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = User.loadUserList()
        sortingUsers()
        
        collectionView.registerNibForCellClass(UserCell.self)
        collectionView.register(UINib(nibName: String(describing: UserCollectionReusableView.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: UserCollectionReusableView.self))
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionViewSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Array(collectionViewSource.values)[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = items[indexPath.row].collectionView(collectionView, cellForItemAt: indexPath, delegate: self)
  
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UserCollectionReusableView", for: indexPath) as! UserCollectionReusableView
            reusableView.headerLabel.text = String(collectionViewHeaders[indexPath.section])
            return reusableView
        default:
            fatalError("Unexpected element kind")
        }
    }
    
    // MARK: - Custom Methods
    
    private func sortingUsers() {
        if let users = items as? [User] {
            
            var arrayOfNames: [String] = []
            
            users.forEach { (user) in
                arrayOfNames.append(user.firstName)
            }
            
            getCollectionData(words: arrayOfNames)
        }
    }
    
    private func createCollectionData(wordList: [String]) -> (firstSymbols: [Character], source: [Character : [String]]) {
        var firstSymbols = Set<Character>()
        
        wordList.forEach { _ = firstSymbols.insert(getFirstSymbol(word: $0)) }
        
        var collectionViewSource = [Character : [String]]()
        
        for symbol in firstSymbols {
            var words = [String]()
            
            for word in wordList {
                if symbol == getFirstSymbol(word: word) {
                    words.append(word)
                }
            }
            
            collectionViewSource[symbol] = words.sorted(by: { $0 < $1})
        }
        
        let sortedSymbols = firstSymbols.sorted(by: { $0 < $1 })
        
        return (sortedSymbols, collectionViewSource)
    }
    
    private func getCollectionData(words: [String]) {
        collectionViewSource = createCollectionData(wordList: words).source
        collectionViewHeaders = createCollectionData(wordList: words).firstSymbols
    }
    
    private func getFirstSymbol(word: String) -> Character {
        return word[word.startIndex]
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 20, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: 51)
    }
}

// MARK: - CollectionCellDelegate
extension CollectionViewController: CollectionCellDelegate {
    func collectionCell(didSelect cell: UICollectionViewCell, buttonAction: ButtonAction) {
        if let indexPath = collectionView.indexPath(for: cell) {
            print(#line, #function, indexPath, buttonAction)
        }
    }
}
