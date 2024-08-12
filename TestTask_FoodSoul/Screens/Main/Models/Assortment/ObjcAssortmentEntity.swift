//
//  ObjcAssortmentEntity.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

import UIKit

@objc class ObjcAssortmentEntity: NSObject {
    @objc var title: String = ""
    @objc var recipeDescription: String = ""
    @objc var image: UIImage? = nil
    @objc var isFavorite: Bool = false
    @objc var weight: WeightEntity = WeightEntity(weight: 0, type: ObjcAssortmentWeightType.gramm)
    @objc var price: Price = Price(price: 0)
    @objc var category: [ObjcFilter] = []
    @objc var counter: Int = 0
    @objc var additionalInfo: [AdditionalInfo] = []

    override init() { 
        super.init()
    }
}

@objc class AdditionalInfo: NSObject {
    @objc var name: String
    @objc var color: UIColor
    
    @objc init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}
