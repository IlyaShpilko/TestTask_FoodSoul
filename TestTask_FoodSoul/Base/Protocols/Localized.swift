//
//  Localized.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import Foundation

protocol Localized { }

extension Localized {
    func locale(string: String) -> String {
        NSLocalizedString(string, comment: string)
    }
}
