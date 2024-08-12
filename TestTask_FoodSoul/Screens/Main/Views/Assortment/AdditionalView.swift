//
//  AdditionalView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import UIKit

final class AdditionalView: UIView {
    private let label = LabelBuilder(with: .description)
        .build
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(label)
        label.pin(to: self, constant: 6.0)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
    
    func update(title: String, background: UIColor?) {
        self.backgroundColor = background
        label.text = title
    }
    
    func addConstraints(view: UIView, constant: CGFloat = 10, isFirst: Bool) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if isFirst {
            NSLayoutConstraint.activate(
                [
                    topAnchor.constraint(equalTo: view.topAnchor, constant: 6),
                    leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                ]
            )
        } else {
            NSLayoutConstraint.activate(
                [
                    topAnchor.constraint(equalTo: view.bottomAnchor, constant: 6),
                    leadingAnchor.constraint(equalTo: view.leadingAnchor),
                ]
            )
        }
        
    }
}
