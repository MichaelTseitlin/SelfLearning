//
//  Picture.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 13.11.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

struct Picture {
    var picture: UIImage
    
    init(picture: UIImage) {
        self.picture = picture
    }
    
    static func loadPictures() -> [Picture] {
        return [Picture(picture: UIImage(named: "images")!),
                Picture(picture: UIImage(named: "images-2")!),
                Picture(picture: UIImage(named: "images-3")!),
                Picture(picture: UIImage(named: "images-4")!),
                Picture(picture: UIImage(named: "images-5")!),
                Picture(picture: UIImage(named: "images-6")!),
                Picture(picture: UIImage(named: "images-7")!),
                Picture(picture: UIImage(named: "images-8")!),
                Picture(picture: UIImage(named: "images-9")!)
        ]
    }
}

extension Picture: CollectionViewCompatible {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PictureCell = collectionView.dequeueReusableCell(indexPath: indexPath) else {
            fatalError()
        }
        cell.configure(data: self)
        return cell
    }
    
    
}
