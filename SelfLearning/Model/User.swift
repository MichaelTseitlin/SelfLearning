//
//  User.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 04.11.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

struct User {
    
    var firstName: String = "Bob"
    var lastName: String = "Marley"
    var age: Int = 69
    
    var titleFirstLetter: String {
        return String(self.firstName[self.firstName.startIndex].uppercased())
    }
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    init() {}
    
    static func loadUserList() -> [User] {
        return [User(), User(), User(), User(),
        User(firstName: "Alexandr", lastName: "Lobanov", age: 28),
        User(firstName: "Alexandr", lastName: "Burla", age: 40),
        User(firstName: "Michael", lastName: "Tseitlin", age: 25),
        User(firstName: "Ololo", lastName: "Ololoev", age: 5)]
    }
}

extension User: ModelProtocol {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, delegate: CollectionCellDelegate) -> UICollectionViewCell {
        guard let cell: UserCell = collectionView.dequeueReusableCell(indexPath: indexPath) else {
            fatalError()
        }
        cell.cellDelegate = delegate
        cell.configure(data: self)
        return cell
    }
}
