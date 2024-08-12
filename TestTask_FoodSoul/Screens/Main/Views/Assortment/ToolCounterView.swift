//
//  ToolCounterView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import UIKit
import FacebookCore

final class ToolCounterView: UIView {
    
    private let stackView = StackViewBuilder(with: .horizontal)
        .setDistribution(to: .fillEqually)
        .setSpacing(to: 2.0)
        .build
    
    private let plusButton = ButtonBuilder()
        .setTag(to: 0)
        .setTitle(to: StringResourses.plus.text, for: .normal)
        .addTarget(action: #selector(tappedButton))
        .build
    
    private let minusButton = ButtonBuilder()
        .setTag(to: 1)
        .setTitle(to: StringResourses.minus.text, for: .normal)
        .addTarget(action: #selector(tappedButton))
        .isHidden(to: true)
        .build
    
    var action: ((Int) -> Void)?
    
    var isHiddenMinusButton: Bool {
        get {
            minusButton.isHidden
        }
        set {
            minusButton.isHidden = newValue
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        plusButton.layer.cornerRadius = bounds.height / 2
        minusButton.layer.cornerRadius = bounds.height / 2
    }
}

extension ToolCounterView: BaseMethods {
    func addSettings() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }
    
    func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(minusButton, plusButton)
    }
    
    func addConstraints() {
        stackView.pin(to: self)
        NSLayoutConstraint.activate(
            [
                plusButton.heightAnchor.constraint(equalToConstant: 25),
                plusButton.widthAnchor.constraint(equalTo: plusButton.heightAnchor)
            ]
        )
    }
}

@objc extension ToolCounterView {
    func tappedButton(_ sender: UIButton) {
        AppEvents.shared.logEvent(.adClick)
        if sender.tag == 0 {
            action?(1)
        } else if sender.tag == 1 {
            action?(-1)
        }
    }
}
