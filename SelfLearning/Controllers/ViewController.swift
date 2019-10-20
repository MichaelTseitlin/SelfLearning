//
//  ViewController.swift
//  SelfLearning
//
//  Created by Michael Tseitlin on 18.10.2019.
//  Copyright © 2019 Michael Tseitlin. All rights reserved.
//

import UIKit

enum SegueIdentifier: String, CustomStringConvertible {
    case toFirstCollectionView
    case toSecondCollectionView
    
    var description: String {
        return self.rawValue
    }
}

enum TypeOfCell: String, CustomStringConvertible {
    case FirstCollectionViewCell
    case SecondCollectionViewCell
    
    var description: String {
        return self.rawValue
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IACtions
    
    @IBAction func goToFirstCVC() {
        performSegue(withIdentifier: SegueIdentifier.toFirstCollectionView.description, sender: nil)
    }
    
    @IBAction func goToSecondCVC() {
        performSegue(withIdentifier: SegueIdentifier.toSecondCollectionView.description, sender: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let segueIdentifier = SegueIdentifier(rawValue: identifier) else { return }
        
        switch segueIdentifier {
        case .toFirstCollectionView:
            print(#line, #function, "firstCollectionView")
            let destination = segue.destination as? CustomCollectionViewController
            destination?.itemsDidLoad(
                items: ["First", "Second", "Third"],
                reuseIdentifier: TypeOfCell.FirstCollectionViewCell.description)
        case .toSecondCollectionView:
            let destination = segue.destination as? CustomCollectionViewController
            destination?.itemsDidLoad(
                items: [1, 2, 3],
                reuseIdentifier: TypeOfCell.SecondCollectionViewCell.description)
        }
    }

}

