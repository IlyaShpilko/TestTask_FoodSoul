//
//  Promotion.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import UIKit

class Promotion: NSObject {
    var title: String?
    var image: UIImage?
    
    init(title: String? = nil, image: UIImage? = nil) {
        self.title = title
        self.image = image
    }
}
