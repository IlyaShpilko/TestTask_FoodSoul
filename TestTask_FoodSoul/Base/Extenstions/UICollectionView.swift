//
//  UICollectionView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ cell: T.Type) {
        register(cell, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with cell: T.Type, for indexPath: IndexPath) -> T? {
        register(cell)
        return self.dequeueReusableCell(withReuseIdentifier: cell.identifier, for: indexPath) as? T
    }
}
