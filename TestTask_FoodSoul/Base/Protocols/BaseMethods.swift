//
//  BaseMethods.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/6/24.
//

import Foundation

protocol BaseMethods {
    func addSettings()
    func addChilds()
    func addSubviews()
    func addConstraints()
    func addDelegates()
    func addActions()
    func addTargets()
    func addGestureRecognizers()
}

extension BaseMethods {
    func setupUI() {
        addSettings()
        addChilds()
        addSubviews()
        addConstraints()
        addDelegates()
        addActions()
        addTargets()
        addGestureRecognizers()
    }
    
    func addSettings() { }
    func addChilds() { }
    func addSubviews() { }
    func addConstraints() { }
    func addDelegates() { }
    func addActions() { }
    func addTargets() { }
    func addGestureRecognizers() { }
}
