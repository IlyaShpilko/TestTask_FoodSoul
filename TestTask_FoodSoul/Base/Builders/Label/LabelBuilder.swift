//
//  File.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/5/24.
//

import UIKit

final class LabelBuilder: NSObject {
    
    private var label: UILabel!
    
    private let type: LabelFactoryType
    private var model = LabelModel()
    
    @objc var build: UILabel {
        label.text = model.text
        label.tag = model.tag
        label.font = model.font
        label.numberOfLines = model.numberOfLines
        label.textAlignment = model.textAlignment
        label.textColor = model.textColor
        label.translatesAutoresizingMaskIntoConstraints = model.translatesAutoresizingMaskIntoConstraints
        return label
    }
    
    @objc init(with type: LabelFactoryType) {
        self.type = type
        super.init()
        label = createFactory()
    }
    
    @discardableResult
    @objc func setFont(to font: UIFont? = .systemFont(ofSize: 16)) -> Self {
        model.font = font
        return self
    }
    
    @discardableResult
    @objc func setNumberOfLines(to number: Int = 1) -> Self {
        model.numberOfLines = number
        return self
    }
    
    @discardableResult
    @objc func setTextAligement(to aligement: NSTextAlignment = .left) -> Self {
        model.textAlignment = aligement
        return self
    }
    
    @discardableResult
    @objc func setTextColor(to color: UIColor? = .white) -> Self {
        model.textColor = color
        return self
    }
    
    @discardableResult
    @objc func setTranslatesAutoresizingMaskIntoConstraints(to bool: Bool = false) -> Self {
        model.translatesAutoresizingMaskIntoConstraints = bool
        return self
    }
    
    @discardableResult
    @objc func setTag(to tag: Int = 0) -> Self {
        model.tag = tag
        return self
    }
    
    @discardableResult
    @objc func setText(to text: String? = nil) -> Self {
        model.text = text
        return self
    }
    
    private func createFactory() -> UILabel {
        switch type {
        case .title:
            self
                .setText()
                .setTag()
                .setFont(to: .boldSystemFont(ofSize: 16))
                .setNumberOfLines()
                .setTextAligement()
                .setTextColor()
                .setTranslatesAutoresizingMaskIntoConstraints()
            
        case .default:
            self
                .setText()
                .setTag()
                .setFont(to: .systemFont(ofSize: 18))
                .setNumberOfLines()
                .setTextAligement(to: .left)
                .setTextColor()
                .setTranslatesAutoresizingMaskIntoConstraints()
            
        case .description:
            self
                .setText()
                .setTag()
                .setFont(to: .systemFont(ofSize: 12))
                .setNumberOfLines(to: .zero)
                .setTextAligement()
                .setTextColor()
                .setTranslatesAutoresizingMaskIntoConstraints()
            
        }
        return UILabel()
    }
}
