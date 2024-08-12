//
//  WeightEntity.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

import Foundation

@objc class WeightEntity: NSObject {
    var weight: Int
    var type: ObjcAssortmentWeightType
    
    @objc init(weight: Int, type: ObjcAssortmentWeightType) {
        self.weight = weight
        self.type = type
    }
}
