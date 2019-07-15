//
//  TopStackView.swift
//  TinderClone
//
//  Created by djepbarov on 15.07.2019.
//  Copyright © 2019 Davut's Apps. All rights reserved.
//

import UIKit

class BottomStackView: UIStackView {
    
    let firstButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("⏪", for: .normal)
        return b
    }()
    
    let secondButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("❌", for: .normal)
        return b
    }()
    
    let thirdButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("⭐️", for: .normal)
        return b
    }()
    
    let fourthButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("♥️", for: .normal)
        return b
    }()
    
    let fifthButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("⚡️", for: .normal)
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let buttons = [firstButton, secondButton, thirdButton, fourthButton, fifthButton]
        
        for button in buttons {
            addArrangedSubview(button)
        }
        
        distribution = .fillEqually
        self.constrainHeight(constant: 100)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
