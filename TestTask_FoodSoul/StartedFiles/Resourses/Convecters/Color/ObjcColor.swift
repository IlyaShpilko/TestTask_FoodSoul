//
//  ObjcColor.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/6/24.
//

import UIKit

@objc final class ObjcColor: NSObject {
    
    private let type: ObjcColorType
    
    @objc var color: UIColor? {
        switch type {
        case .darkBlueProg:
            return Colors.darkBlueProg.color
            
        case .darkBlue2Prog:
            return Colors.darkBlue2Prog.color
            
        case .stopRedProg:
            return Colors.stopRedProg.color
            
        case .grayProg:
            return Colors.grayProg.color
        }
    }
    
    @objc init(type: ObjcColorType) {
        self.type = type
    }
}
