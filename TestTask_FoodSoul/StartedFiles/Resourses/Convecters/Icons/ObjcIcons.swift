//
//  ObjcIcons.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/7/24.
//

import UIKit

@objc final class ObjcIcons: NSObject {
    
    private let type: ObjsIconsType
    
    @objc var icon: UIImage? {
        switch type {
        case .left_arrow:
            Icons.left_arrow.image
            
        case .heart:
            Icons.heart.image
            
        case .search:
            Icons.search.image
            
        case .info:
            Icons.info.image
            
        case .tomagochiRoll:
            Icons.tomagochiRoll.image
            
        case .sort:
            Icons.sort.image
        }
    }
    
    @objc init(type: ObjsIconsType) {
        self.type = type
    }
}
