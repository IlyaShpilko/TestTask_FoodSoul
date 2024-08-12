//
//  ObjcFilter.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import Foundation

@objc final class ObjcFilter: NSObject {
    
    private let type: ObjcFilterType
    
    @objc init(with type: ObjcFilterType) {
        self.type = type
        super.init()
    }
    
    @objc var text: String {
        switch type {
        case .weRecommend:
            FilterType.we_wecommend_filter.text
        case .favorite:
            FilterType.favorite_filter.text
        case .popular:
            FilterType.popular_filter.text
        case .japaneseFood:
            FilterType.japanese_food_filter.text
        }
    }
    
    @objc func isEqualType(_ object: String) -> Bool {
        return type == reverseConvert(type: FilterType.reverseConvert(to: object))
    }
    
    private func reverseConvert(type: FilterType) -> ObjcFilterType {
        switch type {
        case .we_wecommend_filter:
            return .weRecommend
        case .favorite_filter:
            return .favorite
        case .popular_filter:
            return .popular
        case .japanese_food_filter:
            return .japaneseFood
        }
    }
}
