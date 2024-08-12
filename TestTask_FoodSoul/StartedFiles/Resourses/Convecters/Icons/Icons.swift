//
//  Icons.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/6/24.
//

import UIKit

enum Icons: String, Localized {
    case search
    case info
    case left_arrow
    case heart
    case sort
    case tomagochiRoll
    case first_promotion
    
    var image: UIImage? {
        if self == .sort || self == .tomagochiRoll || self == .first_promotion {
            return UIImage(named: locale(string: self.rawValue))
        }
        
        if #available(iOS 13.0, *) {
            return UIImage(systemName: locale(string: "\(self.rawValue)_system"))
        } else {
            return UIImage(named: locale(string: "\(self.rawValue)_named"))
        }
    }
}
