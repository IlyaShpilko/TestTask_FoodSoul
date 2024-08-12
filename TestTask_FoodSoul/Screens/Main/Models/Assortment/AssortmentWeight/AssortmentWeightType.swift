//
//  AssortmentWeightType.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

import Foundation

enum AssortmentWeightType: String, Localized {
    case gramm
    
    var full: String {
        return locale(string: self.rawValue)
    }
    
    var short: String {
        switch self {
        case .gramm:
            if let char = full.first {
                return "\(char).".lowercased()
            }
        }
        return ""
    }
}
