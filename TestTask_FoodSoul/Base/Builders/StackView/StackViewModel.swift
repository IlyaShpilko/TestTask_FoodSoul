//
//  StackViewModel.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import UIKit

struct StackViewModel {
    var axis: NSLayoutConstraint.Axis
    var alignment: UIStackView.Alignment
    var distribution: UIStackView.Distribution
    var spacing: CGFloat
    var translatesAutoresizingMaskIntoConstraints: Bool
    
    init(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = .zero, translatesAutoresizingMaskIntoConstraints: Bool = false) {
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
    }
}
