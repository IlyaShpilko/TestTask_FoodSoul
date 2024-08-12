//
//  UIView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import UIKit

extension UIView {
    func addSubview(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    @discardableResult
    func addGradient(colors: [UIColor] = [.black, .clear], location: [NSNumber] = [0.0, 1.0]) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = location
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    
    func removeAllConstraints() {
        constraints.forEach {
            removeConstraint($0)
        }
    }
}

@objc extension UIView {
    func pin(to view: UIView, constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                topAnchor.constraint(equalTo: view.topAnchor, constant: constant),
                bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant),
                leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant),
                trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant),
            ]
        )
    }
}

