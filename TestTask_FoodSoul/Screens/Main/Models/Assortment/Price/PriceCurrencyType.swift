//
//  PriceCurrencyType.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

import Foundation

enum PriceCurrencyType: String, Localized {
    case ruble
    
    var full: String {
        return locale(string: self.rawValue)
    }
    
    var short: String {
        switch self {
        case .ruble:
            if let first = full.first {
                return "\(first).".lowercased()
            }
        }
        return ""
    }
}
