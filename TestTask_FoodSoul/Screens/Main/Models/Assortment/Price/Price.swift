//
//  Price.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

import Foundation

@objc class Price: NSObject {
    @objc var price: Int
    @objc var promoPrice: Int
    @objc var currency: ObjcPriceCurrencyType
    
    @objc init(price: Int, promoPrice: Int = -1, currency: ObjcPriceCurrencyType = .ruble) {
        self.price = price
        self.promoPrice = promoPrice
        self.currency = currency
        super.init()
    }
}
