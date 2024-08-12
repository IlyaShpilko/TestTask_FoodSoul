//
//  ProvideBuyType.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import Foundation

enum ProvideBuyType: String, CaseIterable, Localized {
    case delivery
    case pickup
    
    var string: String {
        locale(string: self.rawValue)
    }
    
    static func check(to string: String) -> Self? {
        Self.allCases.first(where: { $0.string == string })
    }
}
