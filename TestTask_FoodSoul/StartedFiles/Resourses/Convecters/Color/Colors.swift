//
//  Colors.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/6/24.
//

import UIKit

enum Colors: String, Localized {
    /// #2C2D3E
    case darkBlueProg
    /// #1A1A23
    case darkBlue2Prog
    /// #B0B8B9
    case stopRedProg
    /// #C33E37
    case grayProg
    
    var color: UIColor? {
        UIColor(named: self.rawValue)
    }
}
