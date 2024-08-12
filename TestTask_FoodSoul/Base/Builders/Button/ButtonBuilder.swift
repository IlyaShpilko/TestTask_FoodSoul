//
//  ButtonBuilder.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import UIKit

final class ButtonBuilder {
    private let button: UIButton
    
    init() {
        button = UIButton(type: .custom)
    }
    
    var build: UIButton {
        button.backgroundColor = .red
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)
        return button
    }
    
    func setTag(to tag: Int) -> Self {
        button.tag = tag
        return self
    }
    
    func setTitle(to title: String, for type: UIControl.State) -> Self {
        button.setTitle(title, for: type)
        return self
    }
    
    func addTarget(action: Selector) -> Self {
        button.addTarget(self, action: action, for: .touchUpInside)
        return self
    }
    
    func isHidden(to hidden: Bool) -> Self {
        button.isHidden = hidden
        return self
    }
}
