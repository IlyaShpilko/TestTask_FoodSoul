//
//  ObjcAssortmentWeightType.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import Foundation

@objc enum ObjcAssortmentWeightType: Int {
    @objc(ObjcAssortmentWeightTypeGramm) case gramm
    
    var assortmentType: AssortmentWeightType {
        switch self {
        case .gramm:
            return .gramm
        }
    }
}
