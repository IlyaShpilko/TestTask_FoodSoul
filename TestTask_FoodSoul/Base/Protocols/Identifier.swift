//
//  Identifier.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import Foundation

protocol Identifier { }

extension Identifier {
    static var identifier: String {
        String(describing: Self.self)
    }
}
