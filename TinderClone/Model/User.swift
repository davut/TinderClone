//
//  User.swift
//  TinderClone
//
//  Created by djepbarov on 15.07.2019.
//  Copyright © 2019 Davut's Apps. All rights reserved.
//

import UIKit

protocol ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel
}

struct User: ProducesCardViewModel {
    let name, profession, imageName: String
    let age: Int
    
    func toCardViewModel() -> CardViewModel {
        let attributedText = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        attributedText.append(NSAttributedString(string: "  \(age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        attributedText.append(NSAttributedString(string: "\n\(profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .light)]))
        return CardViewModel(imageName: imageName, attributedString: attributedText, textAlignment: .left)
    }
}
