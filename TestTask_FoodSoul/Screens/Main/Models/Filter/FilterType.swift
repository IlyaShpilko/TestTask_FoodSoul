//
//  FilterType.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import Foundation

enum FilterType: String, Localized, CaseIterable {
    case we_wecommend_filter
    case favorite_filter
    case popular_filter
    case japanese_food_filter
    
    var text: String {
        locale(string: "\(self.rawValue)")
    }
    
    static func reverseConvert(to text: String) -> Self {
        for filter in self.allCases {
            if filter.text == text {
                return filter
            }
        }
        return .favorite_filter
    }
}
