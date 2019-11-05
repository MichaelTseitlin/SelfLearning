//
//  CustomSectionModel.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 05.11.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import Foundation

struct CustomSectionModel {
    var section: Character
    var model: [CollectionViewCompatible]
    
    init(section: Character,
         model: [CollectionViewCompatible]) {
        self.section = section
        self.model = model
    }
}
