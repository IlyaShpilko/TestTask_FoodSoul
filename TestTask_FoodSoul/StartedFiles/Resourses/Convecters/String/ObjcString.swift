//
//  ObjcString.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/9/24.
//

import Foundation

@objc final class ObjcString: NSObject {
    
    private let objsType: ObjcStringResourses
    
    @objc init(with type: ObjcStringResourses) {
        self.objsType = type
        super.init()
    }
    
    var type: StringResourses {
        switch objsType {
        case .main_title:
            return .main_title
        case .delivery:
            return .delivery
        case .pickup:
            return .pickup
        case .please_provide_delivery_address:
            return .please_provide_delivery_address
        case .in_develop:
            return .in_develop
        case .in_develop_message:
            return .in_develop_message
        case .ok:
            return .ok
        case .plus:
            return .plus
        case .menu:
            return .menu
        case .minus:
            return .minus
        case .roll_or_pizza_in_present:
            return .roll_or_pizza_in_present
        case .test_recipe_title:
            return .test_recipe_title
        case .test_recipe_description:
            return .test_recipe_description
        case .test_additional_info_1:
            return .test_additional_info_1
        case .test_additional_info_2:
            return .test_additional_info_2
        }
    }
    
    @objc var text: String {
        type.text
    }
}
