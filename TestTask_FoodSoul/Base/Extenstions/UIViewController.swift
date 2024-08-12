//
//  UIViewController.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import UIKit

@objc extension UIViewController {    
    func showAlert() {
        let alert = UIAlertController(title: StringResourses.in_develop.text, message: StringResourses.in_develop_message.text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: StringResourses.ok.text, style: .default))
        present(alert, animated: true)
    }
}

extension UIViewController {
    func makeChild(to viewController: UIViewController) {
        viewController.addChild(self)
        viewController.view.addSubview(self.view)
        didMove(toParent: viewController)
    }
}
