//
//  TopStackView.swift
//  TinderClone
//
//  Created by djepbarov on 15.07.2019.
//  Copyright © 2019 Davut's Apps. All rights reserved.
//

import UIKit

class BottomStackView: UIStackView {
    
//    let firstButton: UIButton = {
//        let b = UIButton(type: .system)
//        b.setTitle("⏪", for: .normal)
//        return b
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ["⏪", "❌", "⭐️", "♥️", "⚡️"].forEach { (title) in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
            addArrangedSubview(button)
        }
        
        distribution = .fillEqually
        self.constrainHeight(constant: 100)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
