//
//  ContainerModel.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/9/24.
//

import UIKit

final class ContainerModel {
    
    private var menuState: MenuState = .closed
    private let menuWidth: CGFloat = 200
    
    func changeMenuState(controller: UIViewController) {
        switch menuState {
        case .opened:
            animate(controller: controller, to: 0)
            
        case .closed:
            animate(controller: controller, to: menuWidth)
        }
    }

    private func animate(controller: UIViewController, to x: CGFloat = .zero) {
        UIView.animate(withDuration: 0.5, delay: .zero, usingSpringWithDamping: 0.5, initialSpringVelocity: .zero) {
            controller.view.frame.origin.x = x
        } completion: { completed in
            if completed {
                self.menuState.next()
            }
        }
    }
}
