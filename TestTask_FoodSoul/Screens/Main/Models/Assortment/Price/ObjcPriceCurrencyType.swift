//
//  ObjcPriceCurrencyType.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import Foundation

@objc enum ObjcPriceCurrencyType: Int {
    @objc(ObjcPriceCurrencyTypeRuble) case ruble
    
    var type: PriceCurrencyType {
        switch self {
        case .ruble:
            return .ruble
        }
    }
}
