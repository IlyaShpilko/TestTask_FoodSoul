//
//  ContainerController.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import UIKit

final class ContainerController: UIViewController {
    
    private let model = ContainerModel()
    private let menuViewController: MenuController
    private let rootViewController: NavigationController
        
    @objc init(rootViewController: UIViewController) {
        self.menuViewController = MenuController()
        self.rootViewController = NavigationController(rootViewController: rootViewController)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
}

extension ContainerController: BaseMethods {
    func addSettings() {
        view.backgroundColor = .darkBlueProg
    }
    
    func addChilds() {
        menuViewController.makeChild(to: self)
        rootViewController.makeChild(to: self)
    }
    
    func addDelegates() {
        rootViewController.menuDelegate = self
    }
}

extension ContainerController: NavigationMenuDelegate {
    func openSideMenu() {
        model.changeMenuState(controller: rootViewController)
    }
}
