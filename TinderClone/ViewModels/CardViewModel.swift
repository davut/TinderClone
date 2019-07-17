//
//  CardViewModel.swift
//  TinderClone
//
//  Created by djepbarov on 15.07.2019.
//  Copyright © 2019 Davut's Apps. All rights reserved.
//

import UIKit

class CardViewModel {
    var imageNames: [String]
    var attributedString: NSAttributedString
    var textAlignment: NSTextAlignment
    
    init(imageNames: [String], attributedString: NSAttributedString, textAlignment: NSTextAlignment) {
        self.imageNames = imageNames
        self.attributedString = attributedString
        self.textAlignment = textAlignment
    }
    
    fileprivate var imageIndex = 0 {
        didSet {
            let imageName = imageNames[imageIndex]
            let image = UIImage(named: imageName)
            imageIndexObserver?(imageIndex, image)
        }
    }
    
    var imageIndexObserver: ((Int, UIImage?) -> ())?
    
    func goToNextPhoto() {
        imageIndex = min(imageIndex + 1, imageNames.count - 1)
    }
    
    func goToPreviousPhoto() {
        imageIndex = max(0, imageIndex - 1)
    }
    
}
