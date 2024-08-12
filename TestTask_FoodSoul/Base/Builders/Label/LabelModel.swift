//
//  LabelModel.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/5/24.
//

import UIKit

struct LabelModel {
    var text: String?
    var font: UIFont?
    var textAlignment: NSTextAlignment
    var textColor: UIColor?
    var numberOfLines: Int
    var tag: Int
    var translatesAutoresizingMaskIntoConstraints: Bool
    
    init(
        text: String? = nil,
        font: UIFont? = nil,
        textAlignment: NSTextAlignment = .left,
        textColor: UIColor? = .white,
        numberOfLines: Int = 1,
        tag: Int = 0,
        translatesAutoresizingMaskIntoConstraints: Bool = true
    ) {
        self.text = text
        self.font = font
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.tag = tag
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
    }
}
