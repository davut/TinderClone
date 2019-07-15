//
//  CardView.swift
//  TinderClone
//
//  Created by djepbarov on 14.07.2019.
//  Copyright © 2019 Davut's Apps. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    private let rightTreshold: CGFloat = 100
    private let leftTreshold: CGFloat = -50
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        //Photo by Daria Litvinova on Unsplash
        iv.image = #imageLiteral(resourceName: "daria-litvinova")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.fillSuperview()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
    }
    
    func handleChanged(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: nil)
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        self.transform = CGAffineTransform(rotationAngle: angle).translatedBy(x: translation.x, y: translation.y)
//        self.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        
    }
    
    func handleEnded(_ gesture: UIPanGestureRecognizer) {
        
        let shouldDismissToRight = gesture.translation(in: nil).x > rightTreshold
        let shouldDismissToLeft = gesture.translation(in: nil).x < leftTreshold
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissToRight {
                self.frame = CGRect(x: 1000, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
            } else if shouldDismissToLeft {
                self.frame = CGRect(x: -1000, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
            } else {
                self.transform = .identity
            }
            
            
            
        }) { (_) in
            self.transform = .identity
            self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
