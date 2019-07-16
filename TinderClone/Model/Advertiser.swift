//
//  Advertiser.swift
//  TinderClone
//
//  Created by djepbarov on 16.07.2019.
//  Copyright © 2019 Davut's Apps. All rights reserved.
//

import UIKit

struct Advertiser: ProducesCardViewModel {
    
    let title, subtitle: String
    let imageNames: [String]
    
    func toCardViewModel() -> CardViewModel {
        let attributedText = NSMutableAttributedString(string: title, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        attributedText.append(NSAttributedString(string: "\n\(subtitle)", attributes: [.font: UIFont.systemFont(ofSize: 26, weight: .bold)]))
        return CardViewModel(imageNames: imageNames, attributedString: attributedText, textAlignment: .center)
    }
}
