//
//  CustomSectionModel.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 05.11.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import Foundation

struct CustomSectionModel {
    var section: String
    var model: [CollectionViewCompatible]
    
    init(section: String,
         model: [CollectionViewCompatible]) {
        self.section = section
        self.model = model
    }
}
