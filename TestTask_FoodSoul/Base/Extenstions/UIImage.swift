//
//  UIImage.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/9/24.
//

import UIKit

@objc extension UIImage {
    func setTintColor(to color: UIColor) -> UIImage? {
        defer { UIGraphicsEndImageContext() }
        let image = self.withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        image.draw(in: CGRect(x: .zero, y: .zero, width: size.width, height: size.height))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func resize(to targetSize: CGSize) -> UIImage? {
        defer { UIGraphicsEndImageContext() }
        let size = self.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        var newSize: CGSize
        
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(origin: .zero, size: newSize)
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        self.draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
