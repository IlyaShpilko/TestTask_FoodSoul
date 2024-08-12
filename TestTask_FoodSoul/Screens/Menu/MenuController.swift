//
//  MenuController.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/9/24.
//

import UIKit

final class MenuController: UIViewController {
    private let label = LabelBuilder(with: .title)
        .setText(to: StringResourses.in_develop.text)
        .build
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
}

extension MenuController: BaseMethods {
    func addSettings() {
        view.backgroundColor = .darkBlue2Prog
    }
    
    func addSubviews() {
        view.addSubview(label)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate(
            [
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ]
        )
    }
}
