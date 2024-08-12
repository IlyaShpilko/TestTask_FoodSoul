//
//  UIStackView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubview(_ views: UIView...) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
