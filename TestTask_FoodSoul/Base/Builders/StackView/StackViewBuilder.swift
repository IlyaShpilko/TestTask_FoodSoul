//
//  StackViewBuilder.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import UIKit

@objc final class StackViewBuilder: NSObject {
    
    private var stackView: UIStackView!
    private var model: StackViewModel
    
    private var create: UIStackView {
        return UIStackView()
    }
    
    @objc var build: UIStackView {
        stackView.axis = model.axis
        stackView.alignment = model.alignment
        stackView.distribution = model.distribution
        stackView.spacing = model.spacing
        stackView.translatesAutoresizingMaskIntoConstraints = model.translatesAutoresizingMaskIntoConstraints
        return stackView
    }
    
    @objc init(with axis: NSLayoutConstraint.Axis) {
        model = StackViewModel(axis: axis)
        super.init()
        stackView = create
    }
    
    @objc func setDistribution(to distribution: UIStackView.Distribution) -> Self {
        model.distribution = distribution
        return self
    }
    
    @objc func setAlignment(to alignment: UIStackView.Alignment) -> Self {
        model.alignment = alignment
        return self
    }
    
    @objc func setTranslatesAutoresizingMaskIntoConstraints(to enable: Bool) -> Self {
        model.translatesAutoresizingMaskIntoConstraints = enable
        return self
    }
    
    @objc func setSpacing(to spacing: CGFloat) -> Self {
        model.spacing = spacing
        return self
    }
}
