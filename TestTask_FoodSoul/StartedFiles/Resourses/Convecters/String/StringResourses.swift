//
//  StringResourses.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/9/24.
//

import Foundation

enum StringResourses: String, Localized {
    case main_title
    case delivery
    case pickup
    case please_provide_delivery_address
    case in_develop
    case in_develop_message
    case ok
    case plus
    case menu
    case minus
    case roll_or_pizza_in_present
    case test_recipe_title
    case test_recipe_description
    case test_additional_info_1
    case test_additional_info_2
    case what_are_you_search
    
    var text: String {
        locale(string: self.rawValue)
    }
}
