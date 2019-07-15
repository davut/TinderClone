//
//  TopStackView.swift
//  TinderClone
//
//  Created by djepbarov on 15.07.2019.
//  Copyright © 2019 Davut's Apps. All rights reserved.
//

import UIKit

class TopStackView: UIStackView {
    
    let leftButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Left Button", for: .normal)
        return b
    }()
    
    let middleButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("T", for: .normal)
        return b
    }()
    
    let rightButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("Right Button", for: .normal)
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let buttons = [leftButton, middleButton, rightButton]
        
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
