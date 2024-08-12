//
//  UILabel.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/6/24.
//

import UIKit

extension UILabel {
    func setStrikethroughStyle() {
        guard let text else { return}
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: .zero, length: attributeString.length))
        self.attributedText = attributeString
    }
    
}

