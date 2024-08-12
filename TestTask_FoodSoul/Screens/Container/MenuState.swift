//
//  MenuState.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/9/24.
//

import Foundation

enum MenuState {
    case opened
    case closed
    
    mutating func next() {
        switch self {
        case .opened:
            self = .closed
            
        case .closed:
            self = .opened
        }
    }
}
