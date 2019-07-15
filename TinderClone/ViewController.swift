//
//  ViewController.swift
//  TinderClone
//
//  Created by djepbarov on 14.07.2019.
//  Copyright © 2019 Davut's Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topStackView = TopStackView()
    let bottomStackView = BottomStackView()
    
    let centerView: UIView = {
        let v = UIView()
        let cardView = CardView()
        v.addSubview(cardView)
        cardView.fillSuperview()
        return v
    }()
    
    let bottomView: UIView = {
        let v = UIView()
        v.constrainHeight(constant: 100)
        v.backgroundColor = .white
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let mainStackView = UIStackView(arrangedSubviews: [topStackView, centerView, bottomStackView])
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = .init(top: 0, left: 8, bottom: 0, right: 8)
     
    }


}

