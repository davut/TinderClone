//
//  ViewController.swift
//  TinderClone
//
//  Created by djepbarov on 14.07.2019.
//  Copyright © 2019 Davut's Apps. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let topStackView = TopStackView()
    let cardDeckView = UIView()
    let bottomStackView = BottomStackView()
    
    let bottomView: UIView = {
        let v = UIView()
        v.constrainHeight(constant: 100)
        v.backgroundColor = .white
        return v
    }()
    
    let cardViewModels = [
        User(name: "Sara", profession: "Singer", imageName: "daria-litvinova", age: 20).toCardViewModel(),
        User(name: "Jane", profession: "Student", imageName: "nik-macmillan", age: 19).toCardViewModel()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupDummyCard()
    }
    
    func setupDummyCard() {
        cardViewModels.forEach { (cardViewModel) in
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: cardViewModel.imageName)
            cardView.infoLabel.attributedText = cardViewModel.attributedString
            cardDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }
    
    func setupLayout() {
        view.backgroundColor = .white
        let mainStackView = UIStackView(arrangedSubviews: [topStackView, cardDeckView, bottomStackView])
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = .init(top: 0, left: 8, bottom: 0, right: 8)
    }


}

