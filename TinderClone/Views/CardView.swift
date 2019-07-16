//
//  CardView.swift
//  TinderClone
//
//  Created by djepbarov on 14.07.2019.
//  Copyright © 2019 Davut's Apps. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var cardViewModel: CardViewModel! {
        didSet {
            let imageName = cardViewModel.imageNames.first ?? ""
            imageView.image = UIImage(named: imageName)
            infoLabel.attributedText = cardViewModel.attributedString
            infoLabel.textAlignment = cardViewModel.textAlignment
            if cardViewModel.imageNames.count > 1 {
                addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
                (0..<cardViewModel.imageNames.count).forEach { (_) in
                    let view = UIView()
                    view.layer.cornerRadius = 2
                    view.backgroundColor = UIColor.init(white: 0, alpha: 0.1)
                    topBarStackView.addArrangedSubview(view)
                }
                topBarStackView.arrangedSubviews.first?.backgroundColor = .white
            }
        }
    }
    
    private let treshold: CGFloat = 100
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let gradientLayer = CAGradientLayer()
    
    let topBarStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
       
        
    }
    
    private var imageIndex = 0
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        let tapLocation = gesture.location(in: nil)
        let shouldAdvance = tapLocation.x > frame.width / 2 ? true : false
        if shouldAdvance {
            imageIndex = min(imageIndex + 1, cardViewModel.imageNames.count - 1)
        } else {
            imageIndex = max(0, imageIndex - 1)
        }
        imageView.image = UIImage(named: cardViewModel.imageNames[imageIndex])
        topBarStackView.arrangedSubviews.forEach { (v) in
            v.backgroundColor = UIColor.init(white: 0, alpha: 0.1)
        }
        topBarStackView.arrangedSubviews[imageIndex].backgroundColor = .white
    }
    
    fileprivate func setupLayout() {
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        setupTopBarStackView()
        
        setupGradientLayer()
        
        addSubview(infoLabel)
        infoLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    private func setupTopBarStackView() {
        addSubview(topBarStackView)
        topBarStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: 0, height: 4))
        topBarStackView.distribution = .fillEqually
        topBarStackView.spacing = 4
        
    }
    
    private func setupGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.6, 1.1]
        
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.frame
    }
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            superview?.subviews.forEach({ (subview) in
                subview.layer.removeAllAnimations()
            })
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
    }
    
    private func handleChanged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        self.transform = CGAffineTransform(rotationAngle: angle).translatedBy(x: translation.x, y: translation.y)
    }
    
    private func handleEnded(_ gesture: UIPanGestureRecognizer) {
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismiss = abs(gesture.translation(in: nil).x) > treshold
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismiss {
                self.frame = CGRect(x: 600 * translationDirection, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
            } else {
                self.transform = .identity
            }
            
        }) { (_) in
            self.transform = .identity
            if shouldDismiss {
                self.removeFromSuperview()
            }
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
