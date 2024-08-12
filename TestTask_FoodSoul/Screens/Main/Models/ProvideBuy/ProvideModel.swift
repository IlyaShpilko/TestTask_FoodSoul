//
//  ProvideModel.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

import UIKit

@objc final class ProvideModel: NSObject {
    var types: [ProvideBuyType] = []
    var address: ProvideBuyAddressViewEntity = .init()
    
    override init() {
        super.init()
        self.types = ProvideBuyType.allCases
        
        address = .init(
            title: StringResourses.please_provide_delivery_address.text,
            image: Icons.left_arrow.image
        )
    }
}

